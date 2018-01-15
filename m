From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/3] arm: spear600: Add missing interrupt-parent of rtc
Date: Mon, 15 Jan 2018 13:49:52 +0100
Message-ID: <CAK8P3a05jxsg166snUVf11qYp6TMGYWSBmavXH8Qya3Vo4FDBw@mail.gmail.com>
References: <20180112020711.6gp2pnsxxjzelidq@localhost>
 <20180112032223.GK3626@vireshk-i7>
 <CAOesGMggU73asY1SEUDD_BsWcrGYR___o8e5omjziOPEwJgqBQ@mail.gmail.com>
 <CAK8P3a2SO4=YKBE3L_AKsyfNe77YR7a8F=dvbS=ic03=6NK8MA@mail.gmail.com>
 <CAOesGMgcf9FovbzhPkKnrG4ETRFP3dsSJnTYNfp1wECMFeFOGA@mail.gmail.com>
 <CAL_JsqJVWLazDRB1me2OubqqMhdsqsR+cLSHR+K0OY3dZHcE-w@mail.gmail.com>
 <CAOesGMiyfpRyoe4dxQeNMF5invysVBEy+J5OwUhuop=JyAvZoQ@mail.gmail.com>
 <CAK8P3a3KTz0sOSbO9+sAY1Sv95hZF4Yg1qMzOaXPAZ_1pOgGpg@mail.gmail.com>
 <CAOesGMiHeitS_j9r0DsPf3k1jVJT9_z-bHyrhbB7fQ__LjjaqA@mail.gmail.com>
 <CAK8P3a3MZX-ZsxX9h1-8kVQhn9hqY=c8L1+=e3uTfjEjBCYuPg@mail.gmail.com>
 <20180115042231.GA22978@vireshk-i7>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180115042231.GA22978@vireshk-i7>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: DTML <devicetree@vger.kernel.org>, ARM-SoC Maintainers <arm@kernel.org>, gregkh <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Olof Johansson <olof@lixom.net>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 15, 2018 at 5:22 AM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 12-01-18, 23:05, Arnd Bergmann wrote:
>> I've sent patches for all the remaining MODULE_LICENSE warnings earlier
>> this week, and we should now have patches for almost all the dtc
>> warnings in flight. This is what I still see on my randconfig builder
>> with linux-next + arm-soc/for-next + patches I sent:
>>
>>      arch/arm/boot/dts/spear1310-evb.dtb: Warning (gpios_property):
>> Missing property '#gpio-cells' in node /interrupt-controller@ec801000
>> or bad phandle (referred from /ahb/apb/spi@e0100000:cs-gpios[6])
>>      arch/arm/boot/dts/spear1310-evb.dtb: Warning (gpios_property):
>> Property 'cs-gpios', cell 6 is not a phandle reference in
>> /ahb/apb/spi@e0100000
>>      arch/arm/boot/dts/spear1340-evb.dtb: Warning (dmas_property):
>> Missing property '#dma-cells' in node /interrupt-controller@ec801000
>> or bad phandle (referred from /ahb/apb/serial@b4100000:dmas[4])
>>      arch/arm/boot/dts/spear1340-evb.dtb: Warning (dmas_property):
>> Property 'dmas', cell 4 is not a phandle reference in
>> /ahb/apb/serial@b4100000
>>      arch/arm/boot/dts/spear600-evb.dtb: Warning
>> (interrupts_property): Missing interrupt-parent for
>> /ahb/apb/rtc@fc900000
>
> These are all the warnings we got earlier. So none of my patches are in the
> branch you tested I believe. Can you do a `git log` and see if they are present
> ?

I checked again on today's linux-next and all your patches are there,
and the warning is gone. Whatever caused the warnings to still appear
seems to be gone now. Sorry for the confusion.

      Arnd
