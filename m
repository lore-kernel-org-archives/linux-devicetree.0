From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v3 1/3] nvmem: Update the OF binding to use a subnode for
 the cells list
Date: Wed, 18 Apr 2018 13:12:48 +0100
Message-ID: <9f7d2987-b33e-79b5-ae58-2985fd7334e4@linaro.org>
References: <1521933899-362-1-git-send-email-albeu@free.fr>
 <1521933899-362-2-git-send-email-albeu@free.fr>
 <344e0087-7410-aebb-8a66-c6976064df10@linaro.org>
 <20180417165420.423a691b@avionic-0020>
 <8c4b48ad-e99e-030a-a4ee-b6df0fa59c79@linaro.org>
 <20180417180040.04f53495@avionic-0020> <20180418134119.2e587621@avionic-0020>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180418134119.2e587621@avionic-0020>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alban <albeu@free.fr>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, devicetree@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On 18/04/18 12:41, Alban wrote:
> On Tue, 17 Apr 2018 18:00:40 +0200
> Alban <albeu@free.fr> wrote:
> 
>> On Tue, 17 Apr 2018 16:44:01 +0100
>> Srinivas Kandagatla <srinivas.kandagatla@linaro.org> wrote:
>>
>>> Thanks for explaining,
>>>
>>> On 17/04/18 15:54, Alban wrote:
>>>> This will not only allow reading the calibration data from nvmem, but
>>>> will also create a partition on the MTD device, which is not acceptable.
>>>> With my proposed binding this would become:
>>>>
>>>> flash@0 {
>>>> 	#address-cells = <1>;
>>>> 	#size-cells = <1>;
>>>> 	compatible = "s25sl064a";
>>>> 	reg = <0>;
>>>>
>>>> 	nvmem-cells {
>>>> 		compatible = "nvmem-cells";
>>>> 		#address-cells = <1>;
>>>> 		#address-cells = <1>;
>>>>
>>>> 		calibration: calib@404 {
>>>> 			reg = <0x404 0x10>;
>>>> 		};
>>>> 	};
>>>
>>> Why can't we make nvmem-cells node a nvmem provider in this case?
>>> Which should work!
>>
>> TBH I just copied what have been done to fix the same problem with the
>> MTD partitions. But yes we could also just extend the current binding
>> to require a compatible string on each nvmem-cell, which would not
>> require any code change to support.
> 
> However this scheme will not work if the device node binding already
> have subnodes with addresses. The addressing, as specified by
> #address-cells and #size-cells, might be incompatible or might overlap.
> Using the nvmem-cells subnode solve this problem.
> 

I was also suggesting you to use nvmem-cell subnode, but make it a 
proper nvmem provider device, rather than reusing its parent device.

You would end up some thing like this in dt.

flash@0 {
	#address-cells = <1>;
	#size-cells = <1>;
	compatible = "s25sl064a";
	reg = <0>;

	nvmem-cells {
		compatible = "mtd-nvmem";
		#address-cells = <1>;
		#size-cells = <1>;

		calibration: calib@404 {
			reg = <0x404 0x10>;
		};
	};
};

--srini

> Alban
> 
