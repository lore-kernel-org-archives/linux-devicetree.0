From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 4/5] firmware: Add coreboot device tree binding
 documentation
Date: Mon, 3 Apr 2017 09:32:42 -0500
Message-ID: <20170403143242.5f7pqbawk5vcxe5j@rob-hp-laptop>
References: <1490717489-19218-1-git-send-email-thierry.escande@collabora.com>
 <1490717489-19218-5-git-send-email-thierry.escande@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1490717489-19218-5-git-send-email-thierry.escande-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Escande <thierry.escande-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 28, 2017 at 06:11:28PM +0200, Thierry Escande wrote:
> From: Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> 
> This patch adds documentation describing a device tree binding for the
> coreboot firmware. It is meant to be dynamically added during boot and
> contains address definitions for the coreboot table (a list of
> variable-sized descriptors providing information about various compile-
> and run-time generated firmware parameters) and the CBMEM area (the
> structure containing most run-time resident memory regions set up by
> coreboot).
> 
> These definitions allow kernel drivers to easily access data contained
> in and pointed to by these regions (such as coreboot's in-memory log).
> (An example implementation can be seen in the following patch)
> 
> Signed-off-by: Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Signed-off-by: Thierry Escande <thierry.escande-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> ---
>  .../devicetree/bindings/firmware/coreboot.txt      | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/firmware/coreboot.txt

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
