From: David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] misc/at25: Add an .id_table to at25 to facilitate
 driver loading and binding.
Date: Mon, 17 Sep 2012 10:06:41 -0700
Message-ID: <505758A1.1050205@gmail.com>
References: <1345662238-15211-1-git-send-email-ddaney.cavm@gmail.com>
 <1345662238-15211-3-git-send-email-ddaney.cavm@gmail.com>
 <CAMSQXEHXG=DGT7egbSfdNb2VFTXS+HQ0DoaA2v9dTX_2zn2pZg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAMSQXEHXG=DGT7egbSfdNb2VFTXS+HQ0DoaA2v9dTX_2zn2pZg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Ivo Sieben <meltedpianoman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/17/2012 12:49 AM, Ivo Sieben wrote:
> Hi,
>
> 2012/8/22 David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
>> From: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
>>
>>   /*-------------------------------------------------------------------------*/
>> +static const struct spi_device_id at25_id[] = {
>> +       {"at25", 0},
>> +       {"m95256", 0},
>> +       { }
>> +};
>> +MODULE_DEVICE_TABLE(spi, at25_id);
>
> I use this driver for the ST M95040, M95020 & M95010 eeprom devices.
> So wouldn't it be better to use the "famliy" name for these chips
> ("m95" instead of "m95256").
>

These are matched against device tree compatible properties.  You could 
propose adding a generic "st,95xxx" compatible property and adding that 
to the at25_id list.  But I don't think we want to remove "m95256", as 
we have deployed devices using this binding.

David Daney
