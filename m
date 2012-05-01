From: Viresh Kumar <viresh.kumar@st.com>
Subject: Re: [PATCH 1/3] mmc/sdhci-spear: No need to check 'pdev == NULL'
 in probe
Date: Tue, 1 May 2012 14:18:50 +0530
Message-ID: <4F9FA372.3060807@st.com>
References: <841301f38cfc2d1170378306f1640d7653652505.1332817654.git.viresh.kumar@st.com> <4F83FF20.9010701@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <4F83FF20.9010701@st.com>
Sender: linux-mmc-owner@vger.kernel.org
To: "cjb@laptop.org" <cjb@laptop.org>
Cc: spear-devel <spear-devel@list.st.com>, "viresh.linux@gmail.com" <viresh.linux@gmail.com>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "sr@denx.de" <sr@denx.de>
List-Id: devicetree@vger.kernel.org

On 4/10/2012 3:06 PM, Viresh KUMAR wrote:
> On 3/27/2012 8:40 AM, Viresh KUMAR wrote:
>> > pdev is guaranteed to be valid in probe. And so check is not required to check
>> > if it is non-NULL. Remove it.
>> > 
>> > Signed-off-by: Viresh Kumar <viresh.kumar@st.com>
> Hi Chris,
> 
> Can you atleast apply first two patches of this set. Will rework patch 3/3 after
> DT support is finalized by arnd.

Chris,

Can you please apply these?

-- 
viresh
