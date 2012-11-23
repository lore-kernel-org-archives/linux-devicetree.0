From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH V2 2/2] mfd: stmpe: Extend DT support in stmpe driver
Date: Fri, 23 Nov 2012 21:15:43 +0530
Message-ID: <CAKohpok_PghpJ11DfqFrhL6j3UJ6BeozZyB4ioUU5aL01xheag@mail.gmail.com>
References: <f1d508c64a01dfd492a1ab1fda28af4b7647d8ab.1353560936.git.viresh.kumar@linaro.org>
	<b81641051dad9660b72b0028d001e5620d901160.1353560936.git.viresh.kumar@linaro.org>
	<20121122112451.GE4328@gmail.com>
	<CAKohpo=EWFNddjMNwHO4u4-bi1AQ4cvsJ4DfFOgaFv3oVfheZg@mail.gmail.com>
	<20121123093633.GD17471@gmail.com>
	<CAKohpo=4orAgwVRRvukj+tu67CyVvoUegsJ7eXaCMA9exruqEA@mail.gmail.com>
	<20121123154311.GA28552@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121123154311.GA28552@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: sameo@linux.intel.com, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, spear-devel@list.st.com, Vipul Kumar Samar <vipulkumar.samar@st.com>
List-Id: devicetree@vger.kernel.org

On 23 November 2012 21:13, Lee Jones <lee.jones@linaro.org> wrote:
> No, in DT devices named as part of the hiearchy, so you'd have:
>
> soc-u9500/i2c@80004000/stmpe1601@40/stmpe_keypad
> soc-u9500/i2c@80004000/stmpe1601@41/stmpe_keypad
> ... etc

Obviously. How could i miss this naming :(

Okay, so i need to pass -1 and that would be enough. Right?

--
viresh
