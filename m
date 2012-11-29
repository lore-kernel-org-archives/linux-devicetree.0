From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH V4 Resend 3/3] mfd: stmpe: Update DT support in stmpe driver
Date: Thu, 29 Nov 2012 14:57:05 +0530
Message-ID: <CAKohpomw7yn-wj==qscuQ5j2FGv=Ks3RU9py=NWUnnT0_cK1aA@mail.gmail.com>
References: <d1f012d7bb2835f696fc100073f2eb16d9f6204d.1354128258.git.viresh.kumar@linaro.org>
	<eb65ded18560f902b0713d9df57c43e07704b5ec.1354128258.git.viresh.kumar@linaro.org>
	<20121129092308.GT2013@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121129092308.GT2013@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: sameo@linux.intel.com, grant.likely@secretlab.ca, rabin.vincent@stericsson.com, shiraz.hashim@st.com, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, spear-devel@list.st.com, linus.walleij@linaro.org, Vipul Kumar Samar <vipulkumar.samar@st.com>
List-Id: devicetree@vger.kernel.org

On 29 November 2012 14:53, Lee Jones <lee.jones@linaro.org> wrote:
>> From: Vipul Kumar Samar <vipulkumar.samar@st.com>
>> +     /*
>> +      * Distinct names of same cell-type within multiple instances of stmpe
>> +      * will be guaranteed by DT.
>> +      */
>> +     pdata->id = -1;
>
> And what if we're not booting with DT?

Then it is responsibility of code creating platform data for stmpe to fill
it appropriately. i.e. If there is only one instance of stmpe on board, then
better pass it as -1, else start counting.
