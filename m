From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v6 5/6] dt-bindings: add documentation for Mediatek SoC
Date: Thu, 5 Jun 2014 12:26:29 +0200
Message-ID: <CABuKBe+rgPdCxQiDR34Cdb-mZKksbgLrEnHQre9PhgFY=WvrDg@mail.gmail.com>
References: <1401468964-5307-1-git-send-email-matthias.bgg@gmail.com>
 <1401468964-5307-6-git-send-email-matthias.bgg@gmail.com>
 <CAL_Jsq+jYZj_OcFkkBmpbGyEDKT7P_4Ek3os-qNFs9FfzxJvNw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_Jsq+jYZj_OcFkkBmpbGyEDKT7P_4Ek3os-qNFs9FfzxJvNw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robherring2@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko.stuebner@bq.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Florian Vaussard <florian.vaussard@epfl.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Gregory Clement <gregory.clement@free-electrons.com>, Thomas Gleixner <tglx@linutronix.de>, Soren
List-Id: devicetree@vger.kernel.org

2014-06-03 14:51 GMT+02:00 Rob Herring <robherring2@gmail.com>:
> On Fri, May 30, 2014 at 11:56 AM, Matthias Brugger
> <matthias.bgg@gmail.com> wrote:
>> This adds a DT binding documentation for the MT6589 SoC from Mediatek.
>>
>> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
>> ---
>>  .../devicetree/bindings/arm/mediatek-mt65xx.txt    |    8 ++++++++
>
> How about just mediatek.txt? Otherwise:

You are right, I will fix this for v7 of the series.

>
> Acked-by: Rob Herring <robh@kernel.org>
>
> Rob
>
>>  1 file changed, 8 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek-mt65xx.txt
>>
>> diff --git a/Documentation/devicetree/bindings/arm/mediatek-mt65xx.txt b/Documentation/devicetree/bindings/arm/mediatek-mt65xx.txt
>> new file mode 100644
>> index 0000000..d6ac71f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/mediatek-mt65xx.txt
>> @@ -0,0 +1,8 @@
>> +Mediatek MT6589 Platforms Device Tree Bindings
>> +
>> +Boards with a SoC of the Mediatek MT6589 shall have the following property:
>> +
>> +Required root node property:
>> +
>> +compatible: must contain "mediatek,mt6589"
>> +
>> --
>> 1.7.9.5
>>



-- 
motzblog.wordpress.com
