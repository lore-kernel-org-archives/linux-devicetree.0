From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/7] ARM: dts: NSP: DT Clean-ups
Date: Fri,  6 Jan 2017 09:47:30 -0800
Message-ID: <20170106174730.28521-1-f.fainelli@gmail.com>
References: <1481652831-2744-1-git-send-email-jon.mason@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1481652831-2744-2-git-send-email-jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 13 Dec 2016 13:13:45 -0500, Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
> The QSPI entry was added out of the sequental order that the rest of the
> DTSI file is in. Move it to make it fit in properly. Also, some other
> entries have been added in a non-alphabetical order in the DTS files,
> making them different from the other NSP DTS files. Move the relevant
> peices to make it match. Finally, remove errant new lines.
>
> Signed-off-by: Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> ---

Applied, thanks!
--
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
