From: viresh kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH Resend 1/2] mmc: sdhci-spear: add device tree bindings
Date: Fri, 28 Sep 2012 15:48:16 +0530
Message-ID: <CAOh2x=n8HkH2Nd_t5hDiA8nxLyWQsCn-kF+zrPkhR0fWDCpanQ@mail.gmail.com>
References: <viresh.kumar@linaro.org>
	<a42729885c593f61bb62c45f229174d9f7370c40.1348809217.git.viresh.kumar2@arm.com>
	<87lifuv7rm.fsf@octavius.laptop.org>
	<CAOh2x=mrL6ZT5xR1HMM-r_RQL+J6YE80hq56e9ykndxrEwaHUw@mail.gmail.com>
	<87626yv4jc.fsf@octavius.laptop.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <87626yv4jc.fsf@octavius.laptop.org>
Sender: linux-mmc-owner@vger.kernel.org
To: Chris Ball <cjb@laptop.org>
Cc: spear-devel@list.st.com, linux-mmc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, sr@denx.de
List-Id: devicetree@vger.kernel.org

On Fri, Sep 28, 2012 at 3:43 PM, Chris Ball <cjb@laptop.org> wrote:
> I think now is a good time to get the DT bindings right instead of
> propagating previous hacks into the DT, and this should be a pretty
> simple change -- it's not even a code change, since the code for
> automatically handling a vmmc-supply exists already.  Once we start
> accepting power-gpios properties we can't easily get rid of them later.
>
> If you don't have time to work on this, I guess I could accept the patch
> without the power-gpios handling included (since it'll still work with
> a DT that provides a vmmc-supply), but I don't want to take the patch
> as-is and legitimize the power-gpios binding.  Does that make sense?

Can't disagree with you, for not accepting it :)

Ok. For now i would just remove the power-gpios stuff and somebody from
ST will fix it with regulator stuff later.

--
viresh
