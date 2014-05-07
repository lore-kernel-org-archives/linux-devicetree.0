From: Belisko Marek <marek.belisko@gmail.com>
Subject: Re: [PATCH v2 2/3] ARM: dts: oma3-gta04: Add display support
Date: Wed, 7 May 2014 09:21:38 +0200
Message-ID: <CAAfyv36L_vh+iwrqsePsF8oOxOJ=JXUAk2nJ6F120w+0ivAn8w@mail.gmail.com>
References: <1398284120-4986-1-git-send-email-marek@goldelico.com>
	<1398284120-4986-3-git-send-email-marek@goldelico.com>
	<5369DAC6.6050608@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <5369DAC6.6050608@ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, rdunlap@infradead.org, Benoit Cousson <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-fbdev@vger.kernel.org, "Dr. H. Nikolaus Schaller" <hns@goldelico.com>
List-Id: devicetree@vger.kernel.org

Hi Tomi,

On Wed, May 7, 2014 at 9:03 AM, Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
> On 23/04/14 23:15, Marek Belisko wrote:
>> This patch add support for lcd display on gta04 board. Display control
>> is connected on spi (used spi bitbang driver).
>>
>> Signed-off-by: Marek Belisko <marek@goldelico.com>
>> ---
>>  arch/arm/boot/dts/omap3-gta04.dts | 86 +++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 86 insertions(+)
>
> <snip>
>
>> +&dss {
>> +     pinctrl-names = "default";
>> +     pinctrl-0 = < &dss_dpi_pins >;
>> +
>> +     status = "okay";
>> +
>> +     vdds_dsi-supply = <&vpll2>;
>> +
>> +     dpi_out: endpoint {
>> +               remote-endpoint = <&lcd_in>;
>> +               data-lines = <24>;
>> +       };
>> +
>> +};
>>
>
> Did you try this on 3.15-rc? The above is not right, and I don't think
> it works. You need 'port' node for the dpi_out endpoint.
This patches was tested against 3.15 series and it works. I'l recheck.
>
>  Tomi
>
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
