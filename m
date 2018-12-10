From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH 2/2] arm64: dts: ti: k3-am654-base-board: Add MMC/SD
 support
Date: Mon, 10 Dec 2018 13:33:56 +0530
Message-ID: <c1dd9783-84dc-9dad-ea94-9a14a4ad814d@ti.com>
References: <20181207084233.13700-1-faiz_abbas@ti.com>
 <20181207084233.13700-3-faiz_abbas@ti.com>
 <20181208155427.jmidz4vsw4k4qj36@akan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181208155427.jmidz4vsw4k4qj36@akan>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nishanth Menon <nm@ti.com>, Faiz Abbas <faiz_abbas@ti.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, ulf.hansson@linaro.org, Arnd Bergmann <arnd@arndb.de>, Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org, kishon@ti.com, t-kristo@ti.com, robh+dt@kernel.org, adrian.hunter@intel.com, michal.simek@xilinx.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 08/12/18 9:24 PM, Nishanth Menon wrote:
> On 14:12-20181207, Faiz Abbas wrote:
> 
>> +
>> +&sdhci0 {
>> +	status = "okay";
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&main_mmc0_pins_default>;
>> +	bus-width = <8>;
>> +	non-removable;
>> +	ti,driver-strength-ohm = <50>;
> 
> ^^
> 
>> +};
>> +
>> +&sdhci1 {
>> +	status = "okay";
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&main_mmc1_pins_default>;
>> +	ti,driver-strength-ohm = <50>;
> 
> NAK.
> 
> $ git checkout next-20181207
> $ git grep ti,driver-strength-ohm Documentation
> $
> 
> Nada.. And.. I think "new phy binding" probably introduces this.
> [1] https://patchwork.kernel.org/project/linux-mmc/list/?series=53185
> 
> If your patches are'nt really ready, please send them as RFC, I am not
> really in a mood to track the status of every single driver subsystem.
> 
> If your binding is not in linux next at the baremin, as far as I am
> concerned, this is not ready, and should be RFC.

No, RFC does not say "do not merge" or "this has dependencies". RFC is
used to invite a stronger review when introducing a new concept. Its
fair game to apply patches marked RFC if maintainer is okay with the
content.

Dependencies are either noted in cover-letter or below the patch
tear-line. With what you are asking, looks like patches need to be
resubmitted once dependencies are cleared, even if there is no change in
the content itself. This will be additional work.

That said, if it makes life convenient for you, you can impose such a
rule for patches you need to handle. But I think it will take some
getting used for developers who send patches to you as I don't think
this is a norm elsewhere.

Adding Tony and Arnd as well, in case I have missed some recently
accepted convention.

Thanks,
Sekhar
