From: viresh kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 06/15] clk: SPEAr1310: Fix pcie clock name
Date: Mon, 29 Oct 2012 18:41:02 +0530
Message-ID: <CAOh2x=kdMX6erZEXmxtQA24rHZ4BUodtgtURYOAxLTM4011tPg@mail.gmail.com>
References: <cover.1351492562.git.pratyush.anand@st.com>
	<adb41404ceb2e4e4baa6adfe7df0bfec6c42813f.1351492562.git.pratyush.anand@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <adb41404ceb2e4e4baa6adfe7df0bfec6c42813f.1351492562.git.pratyush.anand@st.com>
Sender: linux-pci-owner@vger.kernel.org
To: Pratyush Anand <pratyush.anand@st.com>
Cc: arnd@arndb.de, shiraz.hashim@st.com, spear-devel@list.st.com, linux-pci@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, olof@lixom.net
List-Id: devicetree@vger.kernel.org

On Mon, Oct 29, 2012 at 12:31 PM, Pratyush Anand <pratyush.anand@st.com> wrote:
> Signed-off-by: Pratyush Anand <pratyush.anand@st.com>
> ---
>  drivers/clk/spear/spear1310_clock.c |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)

It is not required, that you send one patch per file. If two changes to two
files are having the same purpose, then merge them.

Merge this with 5/15.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
