From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v4 2/8] clk: samsung: change scope of samsung clock lock
 to global
Date: Wed, 14 May 2014 09:20:13 +0530
Message-ID: <CAKohpo=J0wbddjn=igwJQNsNQjoddu9A9ApUhuW8Du=6_E=-KQ@mail.gmail.com>
References: <1400029876-5830-1-git-send-email-thomas.ab@samsung.com>
	<1400029876-5830-3-git-send-email-thomas.ab@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1400029876-5830-3-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Thomas Abraham <ta.omasab@gmail.com>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mike Turquette <mturquette@linaro.org>, Shawn Guo <shawn.guo@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Lukasz Majewski <l.majewski@samsung.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Thomas P Abraham <thomas.ab@samsung.com>
List-Id: devicetree@vger.kernel.org

On 14 May 2014 06:41, Thomas Abraham <ta.omasab@gmail.com> wrote:
> From: Thomas Abraham <thomas.ab@samsung.com>
>
> Access to samsung clock lock is required to support newer samsung specific
> clock types. So change the scope of the samsung clock lock to global. And

Maybe bit more detail on why exactly it should be available outside this file.
