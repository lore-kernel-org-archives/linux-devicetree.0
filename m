From: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 2/2] checkpatch: fix spurious vendor compatible
 warnings
Date: Mon, 03 Mar 2014 09:51:37 -0800
Message-ID: <1393869097.13719.88.camel@joe-AO722>
References: <1393604742-14317-1-git-send-email-florian.vaussard@epfl.ch>
	 <1393604742-14317-3-git-send-email-florian.vaussard@epfl.ch>
	 <1393621571.10280.49.camel@joe-AO722> <53145D21.4080101@epfl.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53145D21.4080101-p8DiymsW2f8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: florian.vaussard-p8DiymsW2f8@public.gmane.org
Cc: Andy Whitcroft <apw-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 2014-03-03 at 11:44 +0100, Florian Vaussard wrote:
> Looking at the current documentation, the list of these generic
> placeholders is pretty short:
> 
> $ git grep ',<.*>-' Documentation/devicetree/bindings/ | \
>   grep -P -o ',<.*?>-' | grep -P -o '<.*>' | sort | uniq
> 
> <board>
> <chip>
> <chip name>
> <mcu-chip>
> <processor>
> <soc>
> <SOC>
> <soc-family>
> 
> so '[a-zA-Z0-9-]+' seems more reasonable indeed.

The <mcu-chip> use seems as if it's 2 wildcards

	fsl,<mcu-chip>-<board>

I'm not sure that could work with the current
checkpatch code.

There's a space in "<chip name>" that should
probably be replaced by "<chip-name>" or just
"<chip>" for consistency.

> $compat2 =~ s/\,[a-zA-Z0-9]*\-/<\.\*>\-/g;

hand-escaped, not necessary if using "\Q$compat2\E"

Anyway, if either you or Rob think it appropriate to
submit a patch for either of the things I mentioned
in the first place:

> o Look for ".compatible = "foo" strings in .c and .h files
> o Improve the vendor name match in vendor-prefix.txt by only
>   matching the exact vendor name at the beginning of lines.

or any of the stuff above here, please do.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
