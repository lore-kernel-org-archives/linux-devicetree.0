From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: Re: [Patch v4 2/5] Power: reset: add bindings for keystone reset
 driver
Date: Wed, 21 May 2014 12:09:50 -0400
Message-ID: <537CCFCE.7070701@ti.com>
References: <1400682454-24535-1-git-send-email-ivan.khoronzhuk@ti.com> <5023955.Vhmhn25HgF@wuerfel> <537CCE5A.7030909@ti.com> <13696681.6eGQ96hCX4@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <13696681.6eGQ96hCX4@wuerfel>
Sender: linux-doc-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
Cc: dbaryshkov@gmail.com, dwmw2@infradead.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, grant.likely@linaro.org, rdunlap@infradead.org, linux@arm.linux.org.uk, grygorii.strashko@ti.com, olof@lixom.net, w-kwok2@ti.com, sboyd@codeaurora.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, m-karicheri2@ti.com
List-Id: devicetree@vger.kernel.org

On Wednesday 21 May 2014 12:07 PM, Arnd Bergmann wrote:
> On Wednesday 21 May 2014 19:03:38 Ivan Khoronzhuk wrote:
>>
>> I've slightly confused where should I add these bindings.
>> The main pll controller mostly used by clk driver....
>> As its register set is used also by reset driver it's logically to put 
>> it to bindings/mfd,
>> but pll controller in mfd it's strange....
>>
>> Could you please help to decide where should it be?.
> 
> Put it into Documentation/devicetree/bindings/clock/keystone-pll.txt
> 
I was just about post the same suggestion. Lets do that.

regards,
Santosh

