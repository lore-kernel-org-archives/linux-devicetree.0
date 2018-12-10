From: Faiz Abbas <faiz_abbas@ti.com>
Subject: Re: [PATCH 2/2] arm64: dts: ti: k3-am654-base-board: Add MMC/SD
 support
Date: Mon, 10 Dec 2018 19:03:59 +0530
Message-ID: <a73337c2-977c-c9a8-141e-cf91a4591cbc@ti.com>
References: <20181207084233.13700-1-faiz_abbas@ti.com>
 <20181207084233.13700-3-faiz_abbas@ti.com>
 <20181208155427.jmidz4vsw4k4qj36@akan>
 <c1dd9783-84dc-9dad-ea94-9a14a4ad814d@ti.com>
 <20181210120647.i3ply3p7umvedb3u@akan>
 <66f9d53b-abec-0a28-8eae-ecb99b075db4@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <66f9d53b-abec-0a28-8eae-ecb99b075db4@ti.com>
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
To: Sekhar Nori <nsekhar@ti.com>, Nishanth Menon <nm@ti.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, ulf.hansson@linaro.org, Arnd Bergmann <arnd@arndb.de>, Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org, kishon@ti.com, t-kristo@ti.com, robh+dt@kernel.org, adrian.hunter@intel.com, michal.simek@xilinx.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

On 10/12/18 6:10 PM, Sekhar Nori wrote:
> Hi Nishanth,
> 
> On 10/12/18 5:36 PM, Nishanth Menon wrote:
>> On 13:33-20181210, Sekhar Nori wrote:
>>> On 08/12/18 9:24 PM, Nishanth Menon wrote:
>>>> On 14:12-20181207, Faiz Abbas wrote:
>>>>
>>>>> +
>>>>> +&sdhci0 {
>>>>> +	status = "okay";
>>>>> +	pinctrl-names = "default";
>>>>> +	pinctrl-0 = <&main_mmc0_pins_default>;
>>>>> +	bus-width = <8>;
>>>>> +	non-removable;
>>>>> +	ti,driver-strength-ohm = <50>;
>>>>
>>>> ^^
>>>>
>>>>> +};
>>>>> +
>>>>> +&sdhci1 {
>>>>> +	status = "okay";
>>>>> +	pinctrl-names = "default";
>>>>> +	pinctrl-0 = <&main_mmc1_pins_default>;
>>>>> +	ti,driver-strength-ohm = <50>;
>>>>
>>>> NAK.
>>>>
>>>> $ git checkout next-20181207
>>>> $ git grep ti,driver-strength-ohm Documentation
>>>> $
>>>>
>>>> Nada.. And.. I think "new phy binding" probably introduces this.
>>>> [1] https://patchwork.kernel.org/project/linux-mmc/list/?series=53185
>>>>
>>>> If your patches are'nt really ready, please send them as RFC, I am not
>>>> really in a mood to track the status of every single driver subsystem.
>>>>
>>>> If your binding is not in linux next at the baremin, as far as I am
>>>> concerned, this is not ready, and should be RFC.
>>>
>>> No, RFC does not say "do not merge" or "this has dependencies". RFC is
>>> used to invite a stronger review when introducing a new concept. Its
>>> fair game to apply patches marked RFC if maintainer is okay with the
>>> content.
>>
>> True, fair enough.. RFC is request for comments. Anyways, that is
>> besides the point.
>>>
>>> Dependencies are either noted in cover-letter or below the patch
>>> tear-line. With what you are asking, looks like patches need to be
>>> resubmitted once dependencies are cleared, even if there is no change in
>>> the content itself. This will be additional work.
>>
>> Yes please. There would be other dts changes that are probably ready and
>> I really wont be tracking everything happening on other drivers. If the
>> binding is present at least in next, it is a good indication of things
>> clean and ready to go.
> 
> Agree that bindings should be in linux-next before device-tree files are
> merged.
> 
>>
>>>
>>> That said, if it makes life convenient for you, you can impose such a
>>> rule for patches you need to handle. But I think it will take some
>>> getting used for developers who send patches to you as I don't think
>>> this is a norm elsewhere.
>>>
>>> Adding Tony and Arnd as well, in case I have missed some recently
>>> accepted convention.
>>
>>
>> I have'nt looked at any conventions, The style I prefer to follow when I do
>> submissions: It is my job to get the bindings in, until then my actual
>> dts is just "request for comments". Only after the bindings are merged
>> do I formally submit dts - simply because I dont expect dts maintainer
>> to track what happened to my driver's binding and discussions there of.
> 
> Ok.
> 
>>
>> Seriously, is'nt it really reasonable for dts maintainer to check every
>> single driver's development status in 15 different mailing lists?
>> Because, it sounds like what you are asking. At least I wont have time
>> for it..
>>
>>
>> I really am curious how Arnd / Tony actually pull this one off.. If they
>> have continous cron job for checking if your patch is ready... I doubt
>> it..
> 
> I think you can rely on the author to tell you when something is> actually ready to be merged (and you can tell him/her to remind you).

Yes. I will ping Nishanth once the bindings are in next.

Thanks,
Faiz
