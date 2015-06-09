From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v2 1/3] ARM: STi: Add code to release secondary cores
 from holding pen.
Date: Tue, 9 Jun 2015 14:59:35 +0100
Message-ID: <20150609135935.GE7557@n2100.arm.linux.org.uk>
References: <1433856824-30689-1-git-send-email-peter.griffin@linaro.org>
 <1433856824-30689-2-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1433856824-30689-2-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, patrice.chotard@st.com, maxime.coquelin@st.com, khilman@kernel.org, arnd@arndb.de, olof@lixom.net, devicetree@vger.kernel.org, lee.jones@linaro.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 09, 2015 at 02:33:42PM +0100, Peter Griffin wrote:
> Most upstream devs boot STi platform via JTAG which abuses the
> boot process by setting the PC of secondary cores directly. As
> a consquence, booting STi platforms via u-boot results in only
> the primary core being brought up as the code to manage the
> holding pen is not upstream.

Looking at the current mainline code:

static void sti_secondary_init(unsigned int cpu)
{
        trace_hardirqs_off();

Why is this necessary?  If things aren't correctly setup in generic code,
please report a bug against the generic code rather than working around
the problem in platform specific code.  This is the Linux kernel, not
some closed source project.

What bug are you seeing which required the addition of that?

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
