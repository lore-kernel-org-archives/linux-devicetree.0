From: Pankaj DEV <pankaj.dev@st.com>
Subject: RE: [RFC v1] clk: Add debugfs nodes for
 enable/disable/set-rate/set-parent
Date: Fri, 26 Feb 2016 16:06:48 +0800
Message-ID: <8B5B4FB66A982549A83D90C7791B761007F362D2E1@EAPEX1MAIL2.st.com>
References: <1456454309-25037-1-git-send-email-pankaj.dev@st.com>
 <87fuwg9bog.fsf@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87fuwg9bog.fsf@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Holger Schurig <holgerschurig@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "mturquette@linaro.org" <mturquette@linaro.org>, "kernel@stlinux.com" <kernel@stlinux.com>, "sboyd@codeaurora.org" <sboyd@codeaurora.org>, Laurent MEUNIER <laurent.meunier@st.com>, "lee.jones@linaro.org" <lee.jones@linaro.org>, Maxime COQUELIN <maxime.coquelin@st.com>
List-Id: devicetree@vger.kernel.org

Hey

The prime motive for clk_set_rate is to set new rate for a clock, since the 'clk_rate' currently available, allows only reading.
To provide reading rate from 'clk_set_rate' is just additional feature.

Regards
Pankaj

>-----Original Message-----
>From: Holger Schurig [mailto:holgerschurig@gmail.com]
>Sent: Friday, February 26, 2016 12:54 PM
>To: Pankaj DEV
>Cc: linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
>devicetree@vger.kernel.org; mturquette@linaro.org; kernel@stlinux.com;
>sboyd@codeaurora.org; Laurent MEUNIER; lee.jones@linaro.org; Maxime
>COQUELIN
>Subject: Re: [RFC v1] clk: Add debugfs nodes for enable/disable/set-rate/set-
>parent
>
>Pankaj Dev <pankaj.dev@st.com> writes:
>
>> 1. clk_set_rate : Set new rate to value. Reading returns the current
>> rate
>
>If you can use this to set *and* read it, then "_set_" shouldn't be in the name.
>
>What is wrong with using the existing "clk_rate" for reading/setting the rate?
