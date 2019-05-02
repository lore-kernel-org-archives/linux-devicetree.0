From: shuah <shuah@kernel.org>
Subject: Re: [PATCH v2 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
Date: Thu, 2 May 2019 08:04:14 -0600
Message-ID: <76e84d54-6b7e-8cc1-492b-43822fc43ac4@kernel.org>
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190502105053.GA12416@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190502105053.GA12416@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>, Brendan Higgins <brendanhiggins@google.com>
Cc: frowand.list@gmail.com, keescook@google.com, kieran.bingham@ideasonboard.com, mcgrof@kernel.org, robh@kernel.org, sboyd@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com, linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org, linux-um@lists.infradead.org, Alexander.Levin@microsoft.com, Tim.Bird@sony.com, amir73il@gmail.com, dan.carpenter@oracle.com, dan.j.williams@intel.com, daniel@ffwll.ch, jdike@addtoit.com, joel@jms.id.au, julia.lawall@lip6.fr, khilman@baylibre.com, knut.omang@oracle.com, logang@deltatee.com, mpe@ellerman.id.au, pmladek@suse.com, richard@nod.at, rientjes@google.com, rostedt@goodmis.org, wfg@l
List-Id: devicetree@vger.kernel.org

On 5/2/19 4:50 AM, Greg KH wrote:
> On Wed, May 01, 2019 at 04:01:09PM -0700, Brendan Higgins wrote:
>> ## TLDR
>>
>> I rebased the last patchset on 5.1-rc7 in hopes that we can get this in
>> 5.2.
> 
> That might be rushing it, normally trees are already closed now for
> 5.2-rc1 if 5.1-final comes out this Sunday.
> 
>> Shuah, I think you, Greg KH, and myself talked off thread, and we agreed
>> we would merge through your tree when the time came? Am I remembering
>> correctly?
> 
> No objection from me.
> 

Yes. I can take these through kselftest tree when the time comes.
Agree with Greg that 5.2 might be rushing it. 5.3 would be a good
target.

thanks,
-- Shuah
