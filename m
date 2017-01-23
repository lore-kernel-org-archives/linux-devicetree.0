From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 5/7] NFC: trf7970a: Remove support for
 'vin-voltage-override' DT property
Date: Mon, 23 Jan 2017 10:26:58 -0600
Message-ID: <20170123162658.iuvabiqeohvsdgya@rob-hp-laptop>
References: <20170120191745.29255-1-mgreer@animalcreek.com>
 <20170120191745.29255-6-mgreer@animalcreek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170120191745.29255-6-mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lauro Ramos Venancio <lauro.venancio-430g2QfJUUCGglJvpFV4uA@public.gmane.org>, Aloisio Almeida Jr <aloisio.almeida-430g2QfJUUCGglJvpFV4uA@public.gmane.org>, linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 20, 2017 at 12:17:43PM -0700, Mark Greer wrote:
> The 'vin-voltage-override' DT property is used by the trf7970a
> driver to override the voltage presented to the driver by the
> regulator subsystem.  This is unnecessary as properly specifying
> the regulator chain via DT properties will accomplish the same
> thing.  Therefore, remove support for 'vin-voltage-override'.
> 
> Signed-off-by: Mark Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/net/nfc/trf7970a.txt |  2 --
>  drivers/nfc/trf7970a.c                                 | 11 +----------
>  2 files changed, 1 insertion(+), 12 deletions(-)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
