From: Deepak Sikri <deepak.sikri@st.com>
Subject: Re: [PATCH] cpufreq: SPEAr: Add CPUFreq driver
Date: Tue, 27 Nov 2012 09:46:43 +0530
Message-ID: <50B43EAB.80602@st.com>
References: <7ec0e3f4b81b70f3def4257e6b9781efd4c7a3d2.1353785862.git.viresh.kumar@linaro.org> <20121127040135.GB27305@S2100-06.ap.freescale.net> <CAKohpomSAogQVeBQ8HaWwwoTVCsMha5d_1Wid6N3t5SnVZTc=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CAKohpomSAogQVeBQ8HaWwwoTVCsMha5d_1Wid6N3t5SnVZTc=w@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Shawn Guo <shawn.guo@linaro.org>, Shiraz HASHIM <shiraz.hashim@st.com>, "rjw@sisk.pl" <rjw@sisk.pl>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, spear-devel <spear-devel@list.st.com>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, Mike Turquette <mturquette@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 11/27/2012 9:28 AM, Viresh Kumar wrote:
>>> [snip..]
>>> It's a little bit unusual that cpu runs such a freq range
>>> (166 ~ 600 MHz) at a fixed voltage.  You really have no way
>>> to scale voltage?
> AFAIK, there is no voltage scaling.
>
> @Shiraz/Deepak: Can you confirm?

We do not have any provision for voltage scaling in SPEAr.

Deepak
