From: Chen Yu <chenyu56@huawei.com>
Subject: Re: [PATCH v1 09/12] usb: dwc3: Registering a role switch in the DRD
 code.
Date: Mon, 3 Dec 2018 17:30:02 +0800
Message-ID: <e0b03fee-9d32-d119-80a7-4329c34093c8@huawei.com>
References: <20181203034515.91412-1-chenyu56@huawei.com>
 <20181203034515.91412-10-chenyu56@huawei.com>
 <CAHp75VcU_vP_GEhn2-wvE_LRL2xtsY45kzjCRYU+BAnTcYDA4A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VcU_vP_GEhn2-wvE_LRL2xtsY45kzjCRYU+BAnTcYDA4A@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: wangbinghui@hisilicon.com, USB <linux-usb@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Suzhuangluan <suzhuangluan@hisilicon.com>, Kongfei <kongfei@hisilicon.com>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>
List-Id: devicetree@vger.kernel.org


On 2018/12/3 17:15, Andy Shevchenko wrote:
> On Mon, Dec 3, 2018 at 5:47 AM Yu Chen <chenyu56@huawei.com> wrote:
>>
>> The Type-C drivers use USB role switch API to inform the
>> system about the negotiated data role, so registering a role
>> switch in the DRD code in order to support platforms with
>> USB Type-C connectors.
> 
>> +       pr_info("%s:set role %d\n", __func__, role);
> 
> Noise!
> 
>> +       return role;
>> +
> 
> Redundant blank line.
> 
>> +}
> 
OK. Thanks!

Chen Yu
