From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: emxx_udc device tree bindings
Date: Thu, 20 Sep 2018 21:57:51 +0300
Message-ID: <20180920185751.5h3wzbmlzhxixxu5@mwanda>
References: <1537468552-2533-1-git-send-email-areklis909@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <1537468552-2533-1-git-send-email-areklis909@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Arkadiusz Lis <areklis909@gmail.com>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, linus.walleij@linaro.org, chrisadr@gentoo.org, gregkh@linuxfoundation.org
List-Id: devicetree@vger.kernel.org

I don't know about device tree...

There a bunch of easy aesthetic things one could do.

1) Get rid of forward declarations. (I haven't looked if this is easy).
2) Remove underscore prefixes from names.
3) Fix the comments.  (Delete most of them).
4) pr_info("=== %s()\n", __func__);  <-- delete useles prints
5) Clean up the strange white space.
6) Also it's a bad idea to try to align declarations inside a .c file.
   That's fine for struct declarations in a .h file but in a .c file we
   mess with stuff too much.  You need to change all the declarations to
   make them line up but it's not really related to the patch so you're
   not allowed to change them.  Catch-22.

   In other words change:
-	int             result = -EINVAL;
+	int result = -EINVAL;
7) Remove pointless NULL checks:

	ep = container_of(_ep, struct nbu2ss_ep, ep);
	if (!ep) {

We already know the _ep is non-NULL so that means container_of() can't
be NULL.

regards,
dan carpenter
