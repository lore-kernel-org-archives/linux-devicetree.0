From: Viresh Kumar <viresh.kumar@st.com>
Subject: Re: [PATCH v4 1/2] Input: of_keymap: Introduce matrix_keypad_of_build_keymap()
Date: Fri, 30 Mar 2012 09:25:46 +0530
Message-ID: <4F752EC2.8010403@st.com>
References: <cover.1333009670.git.viresh.kumar@st.com> <1d2fb9b7fdd73f029a043994f24da031700241ca.1333009670.git.viresh.kumar@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <1d2fb9b7fdd73f029a043994f24da031700241ca.1333009670.git.viresh.kumar@st.com>
Sender: linux-input-owner@vger.kernel.org
To: "swarren@nvidia.com" <swarren@nvidia.com>
Cc: "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>, spear-devel <spear-devel@list.st.com>, "viresh.linux@gmail.com" <viresh.linux@gmail.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "olof@lixom.net" <olof@lixom.net>, "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, "sr@denx.de" <sr@denx.de>
List-Id: devicetree@vger.kernel.org

On 3/30/2012 9:03 AM, Viresh KUMAR wrote:
> diff --git a/drivers/input/keyboard/tegra-kbc.c b/drivers/input/keyboard/tegra-kbc.c
> 
> _kbc_platform_data *
> +__devinit tegra_kbc_dt_parse_pdata(struct device_node *np)

As soon as i pressed enter, i realized i missed this one. :(
Will resend V4 with the change requested.


-- 
viresh
