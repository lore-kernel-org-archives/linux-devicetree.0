From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v19 05/12] fpga-mgr: add fpga image information struct
Date: Thu, 29 Sep 2016 10:43:19 -0700
Message-ID: <914ed9fb-c219-d034-7a5e-a400b80dfee0@xilinx.com>
References: <20160928182200.15800-1-atull@opensource.altera.com>
 <20160928182200.15800-6-atull@opensource.altera.com>
 <CAAtXAHcdSsVUE4hQ6isCp7_35ZKb60EAKAgtGwBR41apwPpe=g@mail.gmail.com>
 <CANk1AXTbKhiSu3XN4HgTM_rBBQ315qseH06RzojOOZrV74M7yQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANk1AXTbKhiSu3XN4HgTM_rBBQ315qseH06RzojOOZrV74M7yQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Tull <delicious.quinoa@gmail.com>, Moritz Fischer <moritz.fischer@ettus.com>
Cc: Alan Tull <atull@opensource.altera.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Jon Masters <jcm@redhat.com>, Walter Goossens <waltergoossens@home.nl>, Michal Simek <michal.simek@xilinx.com>, Cyril Chemparathy <cyril.chemparathy@xilinx.com>, Josh Cartwright <joshc@ni.com>, Matthew Gerlach <mgerlach@opensource.altera.com>, Dinh Nguyen <dinguyen@opensource.altera.com>, Devicetree List <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 28.9.2016 21:34, Alan Tull wrote:
> On Wed, Sep 28, 2016 at 6:41 PM, Moritz Fischer
> <moritz.fischer@ettus.com> wrote:
> Hi Moritz,
> 
>> Hi Alan,
>>
>> generally ok with the change.
> 
> Cool!
> 
>>
>> On Wed, Sep 28, 2016 at 11:21 AM, Alan Tull <atull@opensource.altera.com> wrote:
>>
>>> -int fpga_mgr_buf_load(struct fpga_manager *mgr, u32 flags, const char *buf,
>>> -                     size_t count)
>>> +int fpga_mgr_buf_load(struct fpga_manager *mgr, struct fpga_image_info *info,
>>> +                     const char *buf, size_t count)
>>
>> Doesn't this break the both socfpga and zynq if [6/12] and [7/12] are
>> not part of this commit?
>> i.e shouldn't 5,6 and 7 be a single commit?
> 
> Yeah, squashing those would improve bisectability.

Improve? :-)

Definitely this needs to be the part of this commit.

M
