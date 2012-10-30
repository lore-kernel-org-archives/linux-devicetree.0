From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 08/15] SPEAr1310: Add PCIe auxdata for miphy clock initialization
Date: Tue, 30 Oct 2012 21:57:35 +0000
Message-ID: <201210302157.36153.arnd@arndb.de>
References: <cover.1351492562.git.pratyush.anand@st.com> <06c4b001f57084702b42a66565248ae871b909bf.1351492562.git.pratyush.anand@st.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <06c4b001f57084702b42a66565248ae871b909bf.1351492562.git.pratyush.anand@st.com>
Sender: linux-pci-owner@vger.kernel.org
To: Pratyush Anand <pratyush.anand@st.com>
Cc: shiraz.hashim@st.com, viresh.linux@gmail.com, spear-devel@list.st.com, linux-pci@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, olof@lixom.net
List-Id: devicetree@vger.kernel.org

On Monday 29 October 2012, Pratyush Anand wrote:
> Miphy Clock initialization is very specific to controller and its
> instances. Pass this custom function using auxdata.
> 
> Signed-off-by: Pratyush Anand <pratyush.anand@st.com>
> ---
>  arch/arm/mach-spear13xx/spear1310.c |  148 +++++++++++++++++++++++++++++++++++
>  1 files changed, 148 insertions(+), 0 deletions(-)

I think you shouldn't have this in platform code. I don't have the full picture here
but it looks like it could be a separate clock driver so you can use the regular clock
functions. Platform data with callbacks is not acceptable here.

	Arnd
