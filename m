From: Nayna <nayna@linux.vnet.ibm.com>
Subject: Re: [PATCH v6 1/9] dt-bindings: ibm,secureboot: secure boot specific
 properties for PowerNV
Date: Tue, 1 Oct 2019 12:29:06 -0400
Message-ID: <e0575a28-5bd9-1f5b-c09d-ed86cb715165@linux.vnet.ibm.com>
References: <1569594360-7141-1-git-send-email-nayna@linux.ibm.com>
 <1569594360-7141-2-git-send-email-nayna@linux.ibm.com>
 <20191001133330.GA29810@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191001133330.GA29810@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@ozlabs.org, linux-efi@vger.kernel.org, linux-integrity@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Jeremy Kerr <jk@ozlabs.org>, Matthew Garret <matthew.garret@nebula.com>, Mimi Zohar <zohar@linux.ibm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Claudio Carvalho <cclaudio@linux.ibm.com>, George Wilson <gcwilson@linux.ibm.com>, Elaine Palmer <erpalmer@us.ibm.com>, Eric Ricther <erichte@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org



On 10/01/2019 09:33 AM, Rob Herring wrote:
> On Fri, Sep 27, 2019 at 10:25:52AM -0400, Nayna Jain wrote:
>> PowerNV represents both the firmware and Host OS secureboot state of the
>> system via device tree. This patch adds the documentation to give
>> the definition of the nodes and the properties.
>>
>> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
>> ---
>>   .../bindings/powerpc/ibm,secureboot.rst       | 76 ++++++++++++++++
>>   .../devicetree/bindings/powerpc/secvar.rst    | 89 +++++++++++++++++++
>>   2 files changed, 165 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/powerpc/ibm,secureboot.rst
>>   create mode 100644 Documentation/devicetree/bindings/powerpc/secvar.rst
>>
>> diff --git a/Documentation/devicetree/bindings/powerpc/ibm,secureboot.rst b/Documentation/devicetree/bindings/powerpc/ibm,secureboot.rst
>> new file mode 100644
>> index 000000000000..03d32099d2eb
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/powerpc/ibm,secureboot.rst
>> @@ -0,0 +1,76 @@
>> +# SPDX-License-Identifier: GPL-2.0
> Not the right form for reST files.
>
>> +*** NOTE ***
>> +This document is copied from OPAL firmware
>> +(skiboot/doc/device-tree/ibm,secureboot.rst)
> Why copy into the kernel?

Do you mean we do not need the device-tree documentation in the kernel 
when it already exists in the skiboot tree ?

I think I am ok with that. Michael, what do you think ?

Thanks & Regards,
      - Nayna
