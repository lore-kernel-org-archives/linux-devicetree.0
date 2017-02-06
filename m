From: Jani Nikula <jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v3 3/7] drm/tinydrm: Add MIPI DBI support
Date: Mon, 06 Feb 2017 13:25:17 +0200
Message-ID: <87h947blya.fsf@intel.com>
References: <20170131160319.9695-1-noralf@tronnes.org> <20170131160319.9695-4-noralf@tronnes.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170131160319.9695-4-noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 31 Jan 2017, Noralf Trønnes <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org> wrote:
> +static bool mipi_dbi_command_is_read(struct mipi_dbi *mipi, u8 cmd)

Okay this is one giant bikeshedding nitpick, but here goes anyway. Why
do you call MIPI DBI just "mipi", here and all around? Why not
"mipi_dbi" or "dbi"? We never talk about "vesa" displays or use that as
a shorthand when we refer to Display Port either.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Technology Center
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
