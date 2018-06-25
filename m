From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH V4 2/4] watchdog: stm32: add pclk feature for stm32mp1
Date: Mon, 25 Jun 2018 14:52:17 +0200
Message-ID: <b5f62568-ff2f-4a04-212e-a952bf009c88@st.com>
References: <1529571737-3552-1-git-send-email-ludovic.Barre@st.com>
 <1529571737-3552-3-git-send-email-ludovic.Barre@st.com>
 <20180621165335.GA4563@roeck-us.net>
 <0bfe0082-2134-2d3b-322f-cd6c193a9974@st.com>
 <3f65a889-f625-9521-ea09-bcf7b5b24927@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <3f65a889-f625-9521-ea09-bcf7b5b24927@roeck-us.net>
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
To: Guenter Roeck <linux@roeck-us.net>, Ludovic BARRE <ludovic.barre@st.com>
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Guenter,


>> But you are right I forgot to change stm32f429.dtsi.
>> If I add a commit for stm32f429.dtsi, it's Ok for you ?
>>
> 
> Not really. You are imposing a personal preference on others,
> and you would make stm32f429.dtsi inconsistent since it doesn't
> use clock names for anything else.This in turn means that people
> will have an endless source of irritation since they will need
> a clock name for this node but not for others.

Why? This kind of implementation depends on each driver. Isn't ?

Or do you mean that if iwdg driver uses this implementation (clock name 
usage) all nodes inside stm32f429.dtsi should follow the same 
implementation ?

> 
> You will have to get the arm and DT maintainers to agree on this change.

As this patch makes easier integration of new platform, I agree with 
Ludovic proposition.


regards
Alex

> 
> Thanks,
> Guenter
