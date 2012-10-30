From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 10/15] SPEAr13xx: DTS: Add auxiliary data for PCIe host
Date: Tue, 30 Oct 2012 11:17:39 +0530
Message-ID: <CAKohpo=JoZHCeOFTjoF+V0sSz7uJK2onUQqiJ=JhumSUUOVZOg@mail.gmail.com>
References: <cover.1351492562.git.pratyush.anand@st.com>
	<91c2505d23f161ce535b220dea497e2c3abfd7f6.1351492562.git.pratyush.anand@st.com>
	<CAOh2x=ndvJF6qFgXOOQOJfAjFh93vosBrYN4FbvnDK0SW0CcXA@mail.gmail.com>
	<508F4863.2010605@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <508F4863.2010605@st.com>
Sender: linux-pci-owner@vger.kernel.org
To: Pratyush Anand <pratyush.anand@st.com>
Cc: "arnd@arndb.de" <arnd@arndb.de>, Shiraz HASHIM <shiraz.hashim@st.com>, spear-devel <spear-devel@list.st.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "olof@lixom.net" <olof@lixom.net>
List-Id: devicetree@vger.kernel.org

On 30 October 2012 08:54, Pratyush Anand <pratyush.anand@st.com> wrote:
>> What do you mean by auxiliary data in subject?
>
> It used to be plat data earlier, which is being passed from DT now.

Yes. But how did you conclude that it should be called auxiliary data?

I would change subject of this patch to:
ARM: SPEAr13xx: Pass configuration information of PCIe via DT

But i believe you wouldn't need any of above messages and the new message
will also add basic DT support for PCIe.

--
viresh
