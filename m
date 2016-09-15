From: Reza Arbab <arbab@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 1/3] drivers/of: recognize status property of dt
 memory nodes
Date: Thu, 15 Sep 2016 09:31:57 -0500
Message-ID: <20160915143157.mi7xhxfedbic6m63@arbab-laptop>
References: <1473883618-14998-1-git-send-email-arbab@linux.vnet.ibm.com>
 <1473883618-14998-2-git-send-email-arbab@linux.vnet.ibm.com>
 <CAL_JsqK5ngY-eJggPSo5AGcv4CC2b8Y1X_aYzr06_Zf6Kv-u=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <owner-linux-mm@kvack.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqK5ngY-eJggPSo5AGcv4CC2b8Y1X_aYzr06_Zf6Kv-u=w@mail.gmail.com>
Sender: owner-linux-mm@kvack.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Frank Rowand <frowand.list@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>, Bharata B Rao <bharata@linux.vnet.ibm.com>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, Stewart Smith <stewart@linux.vnet.ibm.com>, Alistair Popple <apopple@au1.ibm.com>, Balbir Singh <bsingharora@gmail.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 15, 2016 at 08:43:08AM -0500, Rob Herring wrote:
>On Wed, Sep 14, 2016 at 3:06 PM, Reza Arbab <arbab@linux.vnet.ibm.com> wrote:
>> +       status = of_get_flat_dt_prop(node, "status", NULL);
>> +       add_memory = !status || !strcmp(status, "okay");
>
>Move this into it's own function to mirror the unflattened version
>(of_device_is_available). Also, make sure the logic is the same. IIRC,
>"ok" is also allowed.

Will do. 

>> @@ -1057,6 +1062,9 @@ int __init early_init_dt_scan_memory(unsigned long node, const char *uname,
>>                 pr_debug(" - %llx ,  %llx\n", (unsigned long long)base,
>>                     (unsigned long long)size);
>>
>> +               if (!add_memory)
>> +                       continue;
>
>There's no point in checking this in the loop. status applies to the
>whole node. Just return up above.

I was trying to preserve that pr_debug output for these nodes, but I'm 
also fine with skipping it.

Thanks for your feedback! I'll spin a v3 of this patchset soon.

-- 
Reza Arbab

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
