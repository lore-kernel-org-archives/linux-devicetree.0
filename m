From: Pratyush Anand <pratyush.anand@st.com>
Subject: Re: [PATCH 13/15] SPEAr13xx: update kconfig for PCIe selection
Date: Tue, 30 Oct 2012 08:55:26 +0530
Message-ID: <508F48A6.8070108@st.com>
References: <cover.1351492562.git.pratyush.anand@st.com> <d13ec089ce3a327746ddf20674a0c1f5d22acb88.1351492562.git.pratyush.anand@st.com> <CAOh2x==OzbwA+4ArPG+yJuZHaQ-v_2VS8YNuFYH36ZqrkZLn3A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <CAOh2x==OzbwA+4ArPG+yJuZHaQ-v_2VS8YNuFYH36ZqrkZLn3A@mail.gmail.com>
Sender: linux-pci-owner@vger.kernel.org
To: viresh kumar <viresh.kumar@linaro.org>
Cc: "arnd@arndb.de" <arnd@arndb.de>, Shiraz HASHIM <shiraz.hashim@st.com>, spear-devel <spear-devel@list.st.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "olof@lixom.net" <olof@lixom.net>
List-Id: devicetree@vger.kernel.org

On 10/29/2012 7:03 PM, viresh kumar wrote:
>> >  endmenu
>> >+
>> >+config SPEAR13XX_PCI
>> >+       bool "PCI Express support"
> cant this be module
>

No.
