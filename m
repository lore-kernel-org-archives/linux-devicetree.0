From: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: Re: [PATCH 01/24] Documentation: DT: document compatible string existence
 requirement
Date: Thu, 29 Jan 2015 17:43:29 +0100
Message-ID: <54CA6331.3010909@collabora.co.uk>
References: <20150128234935.20644.89300.stgit@dusk.lan> <20150128234936.20644.76672.stgit@dusk.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150128234936.20644.76672.stgit-orwA252wQtA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Paul,

On 01/29/2015 12:49 AM, Paul Walmsley wrote:
> 
> DT maintainers require all compatible strings used in chip or board
> DTS file to be previously documented somewhere in
> Documentation/devicetree/bindings, per:
> 
> http://marc.info/?l=linux-tegra&m=142201349727836&w=2
>

I would had preferred if checkpatch.pl didn't warn about the most specific
variants of the IP blocks tbh.

Since afaiu those were only added to the compatible string as a way to make
it future proof in case there is going to be needed later. So in that sense
I thought they were not part of the DT ABI.

Now, dumping the unused specific strings in binding docs only to make
checkpatch happy, will have the effect of making those unused strings become
part of the DT ABI. Which mean that couldn't be dropped later if those are
found to not be needed since there won't be a way to know if an OS following
the DT binding will be matching those or not.

But since the decision is to warn for all strings in a compatible property
even if those are not used, I agree with you that it should be documented.

Reviewed-by: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>

Best regards,
Javier
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
