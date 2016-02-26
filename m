From: Holger Schurig <holgerschurig@gmail.com>
Subject: Re: [RFC v1] clk: Add debugfs nodes for enable/disable/set-rate/set-parent
Date: Fri, 26 Feb 2016 08:24:15 +0100
Message-ID: <87fuwg9bog.fsf@gmail.com>
References: <1456454309-25037-1-git-send-email-pankaj.dev@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1456454309-25037-1-git-send-email-pankaj.dev@st.com> (Pankaj
	Dev's message of "Fri, 26 Feb 2016 08:08:29 +0530")
Sender: linux-kernel-owner@vger.kernel.org
To: Pankaj Dev <pankaj.dev@st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mturquette@linaro.org, kernel@stlinux.com, sboyd@codeaurora.org, laurent.meunier@st.com, lee.jones@linaro.org, maxime.coquelin@st.com
List-Id: devicetree@vger.kernel.org

Pankaj Dev <pankaj.dev@st.com> writes:

> 1. clk_set_rate : Set new rate to value. Reading returns the
> current rate

If you can use this to set *and* read it, then "_set_" shouldn't be in
the name.

What is wrong with using the existing "clk_rate" for reading/setting the
rate?
