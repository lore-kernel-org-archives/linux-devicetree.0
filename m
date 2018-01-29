From: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v5 1/2] drm/bridge: Add Cadence DSI driver
Date: Mon, 29 Jan 2018 15:59:33 +0200
Message-ID: <07d82fcd-1e6c-37a8-36b7-d1a81cfeb2ae@ti.com>
References: <20180118134309.13123-1-boris.brezillon@free-electrons.com>
 <9b45c6a3-f26b-59f5-d313-88290a2c5b42@ti.com>
 <20180129141409.0ec356d1@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180129141409.0ec356d1@bbrezillon>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Richard Sproul <sproul-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Simon Hatliff <hatliff-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Suresh Punnoose <sureshp-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Alan Douglas <adouglas-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, "Menon, Nishanth" <nm-l0cyMroinI0@public.gmane.org>, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 29/01/18 15:14, Boris Brezillon wrote:

>> You don't disable the dsi_sys_clk neither in the ok nor in the error paths.
> 
> Hm, it shouldn't be enabled in the first place: the runtime resume
> hook takes care of enabling it, and we don't need this clock to access
> IP registers (which is all we do in the probe).

Ah, right, you can just use pm_runtime directly to enable the IP.

I was looking at the docs, but it wasn't quite clear to me when exactly
dsi_sys_clk is needed. I take it that you can access registers with just
the dsi_p_clk, but you can't really do anything with the IP without
dsi_sys_clk? If so, I think enabling both dsi_p_clk and dsi_sys_clk in
the runtime PM callbacks is ok.

Alternatively, if dsi_sys_clk is only needed for some specific
functionality, a more correct way would be to enable that clock only
when that operation is performed.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
