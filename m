From: David Daney <ddaney@caviumnetworks.com>
Subject: Re: [RFC PATCH v3 0/6] MIPS: Octeon: Use Device Tree.
Date: Thu, 05 May 2011 10:48:06 -0700
Message-ID: <4DC2E2D6.1040502@caviumnetworks.com>
References: <1304614949-30460-1-git-send-email-ddaney@caviumnetworks.com> <BANLkTi=emL85ROThAEz_RsVXL-oJsL6aAQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BANLkTi=emL85ROThAEz_RsVXL-oJsL6aAQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 05/05/2011 10:40 AM, Grant Likely wrote:
> On Thu, May 5, 2011 at 11:02 AM, David Daney<ddaney@caviumnetworks.com>  wrote:
[...]
>>   drivers/of/libfdt/Makefile                         |    8 +
>
> Out of curiosity, how big are the compiled libfdt object files?
>

For my 64-bit mips64 kernel:

[ddaney@dd1 libfdt]$ mips64-linux-size *.o
    text	   data	    bss	    dec	    hex	filename
    7024	      0	      0	   7024	   1b70	built-in.o
    1792	      0	      0	   1792	    700	fdt.o
    4328	      0	      0	   4328	   10e8	fdt_ro.o
     904	      0	      0	    904	    388	fdt_wip.o


David Daney
