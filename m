From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] checkpatch: add DT compatible string documentation check
Date: Tue, 26 Nov 2013 11:43:20 -0600
Message-ID: <5294DDB8.8050207@gmail.com>
References: <1385481675-26675-1-git-send-email-robherring2@gmail.com>	 <1385484225.20100.58.camel@joe-AO722>	 <CAL_JsqKgUQZT4g3fgPe-h8G-zWb1gnfxgT20BDrL+zS5u4URzg@mail.gmail.com> <1385486940.20100.60.camel@joe-AO722>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1385486940.20100.60.camel@joe-AO722>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andy Whitcroft <apw-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/26/2013 11:29 AM, Joe Perches wrote:
> On Tue, 2013-11-26 at 11:11 -0600, Rob Herring wrote:
>> I think we don't really want '+' (or '_') in compatible strings.
> 
> What about lines like:
> arch/powerpc/boot/dts/kmeter1.dts:  compatible = "ucc_geth";

I didn't say we don't have them, but for new bindings we want to flag
things like this. It is fine if new dts files use those existing
bindings, but no one should be creating new bindings with the deprecated
style. The problem is that I can't really automate this check on the
binding documentation until we move to schema based bindings (which
won't be soon). So I would like to warn if dts files use deprecated
styles. I don't expect this to be a frequent occurrence.

Rob

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
