From: Belisko Marek <marek.belisko@gmail.com>
Subject: Re: [PATCH v2 0/3] Add display support for gta04 device
Date: Wed, 7 May 2014 07:35:26 +0200
Message-ID: <CAAfyv34a3FfKUzwz7UDt-77V692eLdJL+h4c0pve2V+g351Weg@mail.gmail.com>
References: <1398284120-4986-1-git-send-email-marek@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1398284120-4986-1-git-send-email-marek@goldelico.com>
Sender: linux-doc-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, rdunlap@infradead.org, Benoit Cousson <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Grant Likely <grant.likely@linaro.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-fbdev@vger.kernel.org, "Dr. H. Nikolaus Schaller" <hns@goldelico.com>, Marek Belisko <marek@goldelico.com>
List-Id: devicetree@vger.kernel.org

Tomi,

any objections to this patch set? If not can you please take it? Thanks.

On Wed, Apr 23, 2014 at 10:15 PM, Marek Belisko <marek@goldelico.com> wrote:
> This 3 patches adding display support for openmoko gta04 device.
> First patch add DT bindings for topolly td028 panel. Second add description for
> dss + panel and third fix panel probing when panel is compiled as module.
>
> Changes from v1:
> - extend panel compatible string by 'omapdss'
> - add tpo-td028 panel to dss_compat_conv_list
> - add MODULE_ALIAS macro to properly probe panel when is compiled as module
>
> Marek Belisko (3):
>   omapdss: panel-tpo-td028ec1: Add DT support.
>   ARM: dts: oma3-gta04: Add display support
>   omapdss: panel-tpo-td028ec1: Add module alias
>
>  .../bindings/video/toppoly,td028ttec1.txt          | 30 ++++++++
>  arch/arm/boot/dts/omap3-gta04.dts                  | 86 ++++++++++++++++++++++
>  arch/arm/mach-omap2/display.c                      |  1 +
>  .../omap2/displays-new/panel-tpo-td028ttec1.c      | 33 ++++++++-
>  4 files changed, 149 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/video/toppoly,td028ttec1.txt
>
> --
> 1.8.3.2
>

BR,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
