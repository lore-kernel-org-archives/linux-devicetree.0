From: Richard Zhao <richard.zhao@linaro.org>
Subject: Re: [PATCH v4 4/7] cpufreq: add clk-reg cpufreq driver
Date: Tue, 3 Jan 2012 21:25:30 +0800
Message-ID: <CAH8gqwVHc9ROQYZNe6b-cUN0ycWhYj8=vJ0geBXUCYN1+XENQA@mail.gmail.com>
References: <1324537753-30590-1-git-send-email-richard.zhao@linaro.org>
	<1324537753-30590-5-git-send-email-richard.zhao@linaro.org>
	<20111223131851.GB13175@sirena.org.uk>
	<20111224085539.GA1892@richard-laptop>
	<20111224122411.GA13778@sirena.org.uk>
	<20111224132831.GB1803@richard-laptop>
	<20111224134227.GA20908@opensource.wolfsonmicro.com>
	<20111224155227.GC1803@richard-laptop>
	<20111226111030.GC8722@opensource.wolfsonmicro.com>
	<20111226134449.GA4259@richard-laptop>
	<20120103090625.GA2914@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20120103090625.GA2914@n2100.arm.linux.org.uk>
Sender: cpufreq-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, arnd@arndb.de, mark.langsdorf@calxeda.com, linaro-dev@lists.linaro.org, marc.zyngier@arm.com, catalin.marinas@arm.com, devicetree-discuss@lists.ozlabs.org, patches@linaro.org, bryanh@codeaurora.org, cpufreq@vger.kernel.org, grant.likely@secretlab.ca, rdunlap@xenotime.net, eric.miao@linaro.org, rob.herring@calxeda.com, kernel@pengutronix.de, jamie@jamieiles.com, davej@redhat.com, davidb@codeaurora.org, shawn.guo@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Russel,

On 3 January 2012 17:06, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Mon, Dec 26, 2011 at 09:44:52PM +0800, Richard Zhao wrote:
>> On Mon, Dec 26, 2011 at 11:10:30AM +0000, Mark Brown wrote:
>> > The *call* is there in the regulator subsystem, it's just that non=
e of
>> > the drivers back it up with an actual implementation yet. =A0Which=
 turns
>> > out to be a good thing as cpufreq can't currently understand varia=
ble
>> > latencies and the governors don't deal well with non-trivial laten=
cies
>> > anyway.
>> but clk API don't have such calls. and many SoCs only adjust clk fre=
quencies, using
>> one single voltage.
>
> That's because it's often not known - especially in the case of PLLs,
> data sheets don't tend to specify how long it takes for the PLL to re=
lock
> after a requested change. =A0If it's important that the PLL be locked=
,
> there will be a bit to poll (or they'll cause the CPU itself to stall
> while the PLL is not locked.)
>
> So, for these kinds of situations, how do you suggest that the clk AP=
I
> provides this information?
In latest v6 version, I get clk transition latency from dt property, an=
d get
regulator transition latency from regulator API.
Could you please help review other arm common changes in v6 version?

Thanks
Richard
