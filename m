From: Alexander Holler <holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>
Subject: Re: [PATCH] deps: introduce new (virtual) property no-dependencies
Date: Wed, 14 May 2014 03:55:33 +0200
Message-ID: <5372CD15.5020001@ahsoftware.de>
References: <537151FF.8070104@ahsoftware.de> <1400006923-7950-1-git-send-email-holler@ahsoftware.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400006923-7950-1-git-send-email-holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am 13.05.2014 20:48, schrieb Alexander Holler:
> 
> The property 'no-dependencies' is virtual property and will not be added
> to any output file.
> 
Hmm, I think it should be non-virtual, otherwise a dtb isn't
reproducible. That means dtc -> dtb -> dts (fdtdump) -> dtb would
produce a different dtb if no-dependencies was used to avoid an
automatic dependency.

Regards,

Alexander Holler

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
