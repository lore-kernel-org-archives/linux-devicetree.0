From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v5 02/44] clk: davinci: New driver for davinci PLL clocks
Date: Fri, 12 Jan 2018 21:48:15 +0530
Message-ID: <eb2b1a63-9c7c-aeca-170f-d38642442438@ti.com>
References: <1515377863-20358-1-git-send-email-david@lechnology.com>
 <1515377863-20358-3-git-send-email-david@lechnology.com>
 <7fc8bd35-0416-216d-8e1e-53a0ec6e8790@ti.com>
 <01fbde0e-36a0-2b19-e385-e63bc4a3ae4a@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <01fbde0e-36a0-2b19-e385-e63bc4a3ae4a@lechnology.com>
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
To: David Lechner <david@lechnology.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Adam Ford <aford173@gmail.com>
List-Id: devicetree@vger.kernel.org

On Friday 12 January 2018 08:55 PM, David Lechner wrote:
>>
>> PLL output on DA850 must never be below 300MHz or above 600MHz (see
>> datasheet table "Allowed PLL Operating Conditions"). Does this take care
>> of that? Thats one of the main reasons I recall I went with some
>> specific values of prediv, pllm and post div in
>> arch/arm/mach-davinci/da850.c
> 
> Apparently, I missed this requirement. It looks like I am going to have to
> rework things so that there is some coordination between the PLL and the
> PLLDIV clocks in order to get the < 300MHz operating points.

Just to make sure we are on the same page. The datasheet
constraint is 600 >= PLLOUT >= 300. PLLOUT is output of POSTDIV.

The operating points are defined in terms of ARM frequency (and
voltage). The OPPs defined in kernel today are here:
https://git.kernel.org/pub/scm/linux/kernel/git/nsekhar/linux-davinci.git/tree/arch/arm/mach-davinci/da850.c#n1092

Thanks,
Sekhar
