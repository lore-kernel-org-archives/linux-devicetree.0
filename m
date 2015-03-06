From: Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH v2 7/7] ARM: dts: am335x-boneblack: Use new binding for
 HDMI
Date: Fri, 6 Mar 2015 17:57:07 +0200
Message-ID: <54F9CE53.908@ti.com>
References: <cover.1425656120.git.jsarha@ti.com> <e68f9647bff12fda5c70b3f068d3feb3911bca91.1425656120.git.jsarha@ti.com> <20150306153632.GL13520@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <20150306153632.GL13520@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: dri-devel@lists.freedesktop.org, airlied@linux.ie, linux-omap@vger.kernel.org, devicetree@vger.kernel.org, bcousson@baylibre.com, tomi.valkeinen@ti.com, rmk+kernel@arm.linux.org.uk, robdclark@gmail.com, moinejf@free.fr
List-Id: devicetree@vger.kernel.org

On 03/06/15 17:36, Tony Lindgren wrote:
> * Jyri Sarha <jsarha@ti.com> [150306 07:37]:
>> Use new binding for the external tda19988 HDMI encoder.
>
> Can this be merged separately after the driver code is
> merged with things still working?
>

Yes absolutely. That is why DRM_TILCDC_SLAVE_COMPAT is there for.

Cheers,
Jyri
