From: Reza Arbab <arbab@linux.vnet.ibm.com>
Subject: Re: [PATCH v6 4/4] of/fdt: mark hotpluggable memory
Date: Wed, 9 Nov 2016 14:15:14 -0600
Message-ID: <20161109201513.6q5fgfwkmyb2k63n@arbab-vm>
References: <1478562276-25539-1-git-send-email-arbab@linux.vnet.ibm.com>
 <1478562276-25539-5-git-send-email-arbab@linux.vnet.ibm.com>
 <CAL_JsqLmAv4Pueq9XveeWMD3Jn_o6mGUcyztx8OajBGTrEd0aQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqLmAv4Pueq9XveeWMD3Jn_o6mGUcyztx8OajBGTrEd0aQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>, Frank Rowand <frowand.list@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Bharata B Rao <bharata@linux.vnet.ibm.com>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, Stewart Smith <stewart@linux.vnet.ibm.com>, Alistair Popple <apopple@au1.ibm.com>, Balbir Singh <bsingharora@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>"linux-kernel@vger.kernel.org" <linux->
List-Id: devicetree@vger.kernel.org

On Wed, Nov 09, 2016 at 12:12:55PM -0600, Rob Herring wrote:
>On Mon, Nov 7, 2016 at 5:44 PM, Reza Arbab <arbab@linux.vnet.ibm.com> wrote:
>> +       hotpluggable = of_get_flat_dt_prop(node, "linux,hotpluggable", NULL);
>
>Memory being hotpluggable doesn't seem like a linux property to me.
>I'd drop the linux prefix. Also, this needs to be documented.

Sure, that makes sense. I'll do both in v7.

-- 
Reza Arbab
