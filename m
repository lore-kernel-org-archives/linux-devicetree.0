From: Gabriel Fernandez <gabriel.fernandez@st.com>
Subject: Re: [PATCH v0 01/15] drivers: clk: st: Support for DIVMUX and PreDiv
 Clocks
Date: Tue, 25 Mar 2014 09:28:41 +0100
Message-ID: <53313E39.9080605@st.com>
References: <1393514668-17440-1-git-send-email-gabriel.fernandez@st.com>
 <1393514668-17440-2-git-send-email-gabriel.fernandez@st.com>
 <20140325052725.32624.39974@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140325052725.32624.39974@quantum>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mike Turquette <mturquette@linaro.org>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net, linux@arm.linux.org.uk, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Pankaj Dev <pankaj.dev@st.com>, Lee Jones <lee.jones@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi Mike,

I want that you take theses patches directly.

Many thanks


Best regards

Gabriel.


On 03/25/2014 06:27 AM, Mike Turquette wrote:
> Quoting Gabriel FERNANDEZ (2014-02-27 07:24:14)
>> +/**
>> + * DOC: Clock mux with a programmable divider on each of its three inputs.
>> + *      The mux has an input setting which effectively gates its output.
>> + *
>> + * Traits of this clock:
>> + * prepare - clk_(un)prepare only ensures parent is (un)prepared
> Minor nitpick but it doesn't look like .prepare or .unprepare are
> supported below. It looks like this copy/paste comment applies to most
> of the clk patches as well.
>
> It's a small problem and doesn't require a patch respin. But perhaps can
> be cleaned up some day in the future.
>
> Do you want me to take these patches directly or are you just looking
> for an Ack?
>
> Regards,
> Mike
