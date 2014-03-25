From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH v0 01/15] drivers: clk: st: Support for DIVMUX and PreDiv Clocks
Date: Mon, 24 Mar 2014 22:27:25 -0700
Message-ID: <20140325052725.32624.39974@quantum>
References: <1393514668-17440-1-git-send-email-gabriel.fernandez@st.com>
 <1393514668-17440-2-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1393514668-17440-2-git-send-email-gabriel.fernandez@st.com>
Sender: linux-doc-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net, linux@arm.linux.org.uk, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Lee Jones <lee.jones@linaro.org>, Gabriel Fernandez <gabriel.fernandez@st.com>, Pankaj Dev <pankaj.dev@st.com>
List-Id: devicetree@vger.kernel.org

Quoting Gabriel FERNANDEZ (2014-02-27 07:24:14)
> +/**
> + * DOC: Clock mux with a programmable divider on each of its three inputs.
> + *      The mux has an input setting which effectively gates its output.
> + *
> + * Traits of this clock:
> + * prepare - clk_(un)prepare only ensures parent is (un)prepared

Minor nitpick but it doesn't look like .prepare or .unprepare are
supported below. It looks like this copy/paste comment applies to most
of the clk patches as well.

It's a small problem and doesn't require a patch respin. But perhaps can
be cleaned up some day in the future.

Do you want me to take these patches directly or are you just looking
for an Ack?

Regards,
Mike
