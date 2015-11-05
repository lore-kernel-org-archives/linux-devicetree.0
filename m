From: Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: Re: [PATCH v7 03/50] powerpc/pci: Cleanup on struct
 pci_controller_ops
Date: Fri, 6 Nov 2015 10:45:37 +1100
Message-ID: <20151105234537.GB30465@gwshan>
References: <1446642770-4681-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1446642770-4681-4-git-send-email-gwshan@linux.vnet.ibm.com>
 <87si4khyau.fsf@gamma.ozlabs.ibm.com>
Reply-To: Gavin Shan <gwshan@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87si4khyau.fsf@gamma.ozlabs.ibm.com>
Sender: linux-pci-owner@vger.kernel.org
To: Daniel Axtens <dja@axtens.net>
Cc: Gavin Shan <gwshan@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, benh@kernel.crashing.org, mpe@ellerman.id.au, aik@ozlabs.ru, bhelgaas@google.com, grant.likely@linaro.org, robherring2@gmail.com, panto@antoniou-consulting.com, frowand.list@gmail.com
List-Id: devicetree@vger.kernel.org

On Fri, Nov 06, 2015 at 09:32:57AM +1100, Daniel Axtens wrote:
>Gavin Shan <gwshan@linux.vnet.ibm.com> writes:
>
>> Each PHB has one instance of "struct pci_controller_ops", which
>> includes various callbacks called by PCI subsystem. In the definition
>> of this struct, some callbacks have explicit names for its arguments,
>> but the left don't have.
>>
>> This adds all explicit names of the arguments to the callbacks in
>> "struct pci_controller_ops" so that the code looks consistent.
>
>Thank you very much for doing this - I should have done it the first
>time I created pci_controller_ops.
>
>They all look good, with one nit-pick:
>
>> -	void		(*shutdown)(struct pci_controller *);
>> +	void		(*shutdown)(struct pci_controller *hose);
>
>I think we're trying to move from hose to phb in new code.
>

Nope, We don't have the movement as I explained in previous reply:
hose for pci_controller while phb represents pnv_phb on PowerNV
platform.

>Once that is fixed:
>  Reviewed-by: Daniel Axtens <dja@axtens.net>
>

Thanks,
Gavin

>
>>  };
>>  
>>  /*
>> -- 
>> 2.1.0
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-pci" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
