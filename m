From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/2] misc: added Spreadtrum's radio driver
Date: Wed, 5 Jul 2017 13:43:15 +0200
Message-ID: <CAK8P3a0izOmWY=v=rv4Na-pcr1Odx6g4w5q3F1N=aU25bEecQA@mail.gmail.com>
References: <20170704101508.30946-1-chunyan.zhang@spreadtrum.com>
 <20170704101508.30946-3-chunyan.zhang@spreadtrum.com> <CAK8P3a0i-H=uU=9DNJbtK2EMX2GJ5cL_TW0roSHpa6tHTcZ2sg@mail.gmail.com>
 <CAAfSe-vj76psYw2uzC2w0pASRT-FGHqXph0zWE_3tmMVzMHKvg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAAfSe-vj76psYw2uzC2w0pASRT-FGHqXph0zWE_3tmMVzMHKvg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chunyan Zhang <zhang.lyra@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Chunyan Zhang <chunyan.zhang@spreadtrum.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Songhe Wei <songhe.wei@spreadtrum.com>, Zhongping Tan <zhongping.tan@spreadtrum.com>, Orson Zhai <orson.zhai@spreadtrum.com>, Linux Media Mailing List <linux-media@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 5, 2017 at 12:18 PM, Chunyan Zhang <zhang.lyra@gmail.com> wrote:
> On 4 July 2017 at 18:51, Arnd Bergmann <arnd@arndb.de> wrote:
>> On Tue, Jul 4, 2017 at 12:15 PM, Chunyan Zhang
> Like I mentioned, SC2342 includes many functions, this patch is only
> adding FM radio function included in SC2342 to the kernel tree.  So I
> figure that its lifetime probably will not be too long, will remove it
> from the kernel tree when we have a clean enough version of the whole
> SC2342 drivers for the official upstreaming.

Would it make sense to add some or all of the other drivers to drivers/staging/
as well in the meantime?

       Arnd
