From: Thor Thayer <tthayer.linux@gmail.com>
Subject: Re: [PATCHv3 3/3] edac: altera: Add EDAC support for Altera SDRAM
Date: Tue, 6 May 2014 16:00:10 -0500
Message-ID: <CAF03EBfSxBnB+yfD-vki2e1d_kE1kCCczuOyQ4XJ+ZbCnL51dQ@mail.gmail.com>
References: <1399330337-16748-1-git-send-email-tthayer@altera.com>
	<1399330337-16748-4-git-send-email-tthayer@altera.com>
	<1399390979.11533.6.camel@linux-builds1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1399390979.11533.6.camel@linux-builds1>
Sender: linux-kernel-owner@vger.kernel.org
To: Dinh Nguyen <dinguyen@altera.com>
Cc: Thor Thayer <tthayer@altera.com>, robherring2@gmail.com, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net, linux@arm.linux.org.uk, dougthompson@xmission.com, grant.likely@linaro.org, Borislav Petkov <bp@alien8.de>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, May 6, 2014 at 10:42 AM, Dinh Nguyen <dinguyen@altera.com> wrote:
> On Mon, 2014-05-05 at 17:52 -0500, Thor Thayer wrote:
>> From: Thor Thayer <tthayer@altera.com>
>>
>> ---
>> v2: Use the SDRAM controller registers to calculate memory size
>>     instead of the Device Tree. Update To & Cc list. Add maintainer
>>     information.
>>
>> v3: EDAC driver cleanup based on comments from Mailing list.
>>
>> Signed-off-by: Thor Thayer <tthayer@altera.com>
>> ---
>>  MAINTAINERS                |    5 +
>>  drivers/edac/Kconfig       |    9 +
>>  drivers/edac/Makefile      |    2 +
>>  drivers/edac/altera_edac.c |  411 ++++++++++++++++++++++++++++++++++++++++++++
>>  4 files changed, 427 insertions(+)
>>  create mode 100644 drivers/edac/altera_edac.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index e67ea24..ecd1277 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1290,6 +1290,11 @@ M:     Dinh Nguyen <dinguyen@altera.com>
>>  S:   Maintained
>>  F:   drivers/clk/socfpga/
>>
>> +ARM/SOCFPGA SDRAM EDAC SUPPORT
>> +M:   Thor Thayer <tthayer@altera.com>
>> +S:   Maintained
>> +F:   drivers/edac/altera_edac.c
>> +
>>  ARM/STI ARCHITECTURE
>>  M:   Srinivas Kandagatla <srinivas.kandagatla@gmail.com>
>>  M:   Maxime Coquelin <maxime.coquelin@st.com>
>> diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
>> index 878f090..4f4d379 100644
>> --- a/drivers/edac/Kconfig
>> +++ b/drivers/edac/Kconfig
>> @@ -368,4 +368,13 @@ config EDAC_OCTEON_PCI
>>         Support for error detection and correction on the
>>         Cavium Octeon family of SOCs.
>>
>> +config EDAC_ALTERA_MC
>> +     bool "Altera SDRAM Memory Controller EDAC"
>
> Can this be tristate?
>
> Dinh
>
Hi Dinh,

We elected to make this a compile time option because it requires a
special preloader to setup the SDRAM for EDAC.

Thor
