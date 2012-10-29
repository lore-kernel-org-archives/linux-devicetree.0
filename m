From: viresh kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 00/15] SPEAr13xx PCIe patches
Date: Mon, 29 Oct 2012 12:46:27 +0530
Message-ID: <CAOh2x=mFS7awO7eoD4zA-sEzg0wY8KNjzTCcXMhOrqBhRcodKA@mail.gmail.com>
References: <cover.1351492562.git.pratyush.anand@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <cover.1351492562.git.pratyush.anand@st.com>
Sender: linux-pci-owner@vger.kernel.org
To: Pratyush Anand <pratyush.anand@st.com>, arm@kernel.org
Cc: arnd@arndb.de, shiraz.hashim@st.com, spear-devel@list.st.com, linux-pci@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, olof@lixom.net
List-Id: devicetree@vger.kernel.org

On Mon, Oct 29, 2012 at 12:31 PM, Pratyush Anand <pratyush.anand@st.com> wrote:
> -- First two patches are common for all platforms on ARM architecture.
> -- Remaining patches belongs to SPEAr13xx architecture.
> -- SPEAr13xx supports both RC and EP mode of PCIe interface. This patchset
>         supports only RC mode.

Hi Pratyush,

For ARM SoC specific patches, that you want Arnd or Olof to apply, please send
them to arm@kernel.org. Arnd and Olof push ARM SoC trees in turns and they
pick them from arm@kernel.org.

--
viresh
