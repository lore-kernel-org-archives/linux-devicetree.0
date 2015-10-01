From: Timur Tabi <timur-N01EOCouUvQ@public.gmane.org>
Subject: Re: [PATCH v3 1/3] powerpc/512x: add LocalPlus Bus FIFO device driver
Date: Thu, 1 Oct 2015 12:11:10 -0500
Message-ID: <560D692E.1010309@tabi.org>
References: <1443115737-3948-1-git-send-email-alex.popov@linux.com>
 <1443115737-3948-2-git-send-email-alex.popov@linux.com>
 <56049CD0.7080104@tabi.org> <560C5325.6070406@linux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <560C5325.6070406-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: alex.popov-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/30/2015 04:24 PM, Alexander Popov wrote:

>> Can you test for "!cs" here instead?
>>
>>> +        e = -EFAULT;
>>> +        goto err_param;
>>> +    }
>
> Unfortunately no: 0 is a valid value for Chip Select.
> Is it OK to leave it like that?

Yes.

>>> +    lpbfifo.ram_bus_addr = sg_dma_address(&sg); /* For freeing later */
>>> +    sg_dma_len(&sg) = lpbfifo.req->size;
>>
>> I don't think sg_dma_len() is meant to be used as an lvalue.
>
> I've double-checked and found many cases of such usage of this macro.
> It seems that I can't avoid it too.

Ok.

>> Driver code that has to parse #address-cells or #size-cells
>> is usually wrong.
>
> I would not call it "parsing", I just check whether the dts-file is good.
> Anyway, could you give me a clue how to do better?

You should use of_n_size_cells() and of_n_addr_cells().

-- 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
