From: Chen Yu <chenyu56@huawei.com>
Subject: Re: [PATCH v1 10/12] hikey960: Support usb functionality of Hikey960
Date: Wed, 5 Dec 2018 09:57:06 +0800
Message-ID: <a1168f88-5679-6245-41d8-5ef4be5493b2@huawei.com>
References: <20181203034515.91412-1-chenyu56@huawei.com>
 <20181203034515.91412-11-chenyu56@huawei.com>
 <CAHp75VdSowHk4meQqqUamSjJJoVT59+pMZ1qjmmWd-W5nWBcUw@mail.gmail.com>
 <6810012e-9a77-dfdf-a738-14ce77a3027a@huawei.com>
 <CAHp75Vf_nemtPuMZV-1ezyYaB_BuuDM6uqaBf9DLBWLdCnm4Gg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75Vf_nemtPuMZV-1ezyYaB_BuuDM6uqaBf9DLBWLdCnm4Gg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: liuyu712@hisilicon.com, Wangbinghui <wangbinghui@hisilicon.com>, USB <linux-usb@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Suzhuangluan <suzhuangluan@hisilicon.com>, Kongfei <kongfei@hisilicon.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Stultz <john.stultz@linaro.org>, "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>
List-Id: devicetree@vger.kernel.org

Hi,

On 2018/12/5 1:47, Andy Shevchenko wrote:
> On Tue, Dec 4, 2018 at 3:40 AM Chen Yu <chenyu56@huawei.com> wrote:
>> On 2018/12/3 17:23, Andy Shevchenko wrote:
>>> On Mon, Dec 3, 2018 at 5:47 AM Yu Chen <chenyu56@huawei.com> wrote:
> 
>>>> +               .of_match_table = of_match_ptr(id_table_hisi_hikey_usb),
>>>
>>> Does it compiles for non-OF case? Why macro is in use?
> 
>> OK. I will add the "CONFIG_OF".
> Why? Is this driver supposed to work without DT?
> 
No. This driver should depend on OF.
Can I solve this by add "dpends on OF" in Kconfig?
