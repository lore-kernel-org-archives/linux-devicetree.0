From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [REGRESSION stable] "of: fix handling of '/' in options for of_find_node_by_path()"
 breaks stdout-path
Date: Mon, 16 Mar 2015 16:53:22 +0100
Message-ID: <5506FC72.80800@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: stable <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi All,

While updating my local working tree to 4.0-rc4 this morning I noticed that I no longer
got any console (neither video output not serial console) on an Allwinner A20 ARM
board.

This is caused by:
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/drivers/of?id=106937e8ccdcf0f4b95fbf0fe9abd42766cade33

Reverting this commit fixes the serial console being gone for me.

After this there still is an issue that tty0 no longer is seen as console, where it
used to be properly used as console in 3.19, I'll investigate that further and send
a separate mail about this.

Greg, this commit has a: "Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> # 3.19" please do not apply
this commit to stable!

u-boot sets stdout-path to this value on the board in question:
"/soc@01c00000/serial@01c28000:115200"

Looking at the first hunk of the patch in question, the problem is obvious:

@@ -714,16 +714,17 @@ static struct device_node *__of_find_node_by_path(struct device_node *parent,
  const char *path)
  {
   struct device_node *child;
- int len = strchrnul(path, '/') - path;
- int term;
+ int len;
+ const char *end;
+ end = strchr(path, ':');
+ if (!end)
+ end = strchrnul(path, '/');
+
+ len = end - path;
   if (!len)
    return NULL;
- term = strchrnul(path, ':') - path;
- if (term < len)
- len = term;
-
  __for_each_child_of_node(parent, child) {
   const char *name = strrchr(child->full_name, '/');
   if (WARN(!name, "malformed device_node %s\n", child->full_name))

The new code to determine len will match (when starting at root) the name of
all child nodes against: "soc@01c00000/serial@01c28000" as it checks for
the ":" first and then uses everything before it. Where as the old code
would match against: "soc@01c00000" which is the correct thing to do.

The best fix I can come up with is to check for both ":" and "/" and use
the earlier one as end to calculate the length. I've not coded this out /
tested this due to -ENOTIME. Note that I've also not audited the rest of
the patch for similar issues.

I will happily test any patches to fix this.

Regards,

Hans
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
