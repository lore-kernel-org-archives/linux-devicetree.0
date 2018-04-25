From: Jan Kiszka <jan.kiszka@web.de>
Subject: Re: [PATCH v7 2/5] of: change overlay apply input data from
 unflattened to FDT
Date: Wed, 25 Apr 2018 22:09:38 +0200
Message-ID: <f63f0277-4318-4a98-6ad4-157f7ef164ea@web.de>
References: <1520122673-11003-1-git-send-email-frowand.list@gmail.com>
 <1520122673-11003-3-git-send-email-frowand.list@gmail.com>
 <09e3db63-cbf9-52a2-ee77-520979f17fea@web.de>
 <7bbf615b-3cdd-6bb4-6918-33e48de4225d@gmail.com>
 <a21dbee8-6e4e-9ceb-c798-dda43c2eae2d@web.de>
 <d7e94a45-5d46-0491-e5dc-2b098a11c5b1@gmail.com>
 <CAL_Jsq+MmUTMrd+jNqUB2=A-q3cCy7+QWOKG0iF6zM0hjCy3PQ@mail.gmail.com>
 <e508f3de-f21b-2510-2c6a-b810073ba1a7@web.de>
 <e06d1c0f-f60d-fc23-cd74-82f557dbc432@web.de>
 <7bbb9472-9c96-6012-68e6-4ec2773c7732@gmail.com>
 <4422f58a-ca7c-16e6-e0df-63faea50f553@web.de>
 <3d7cb4d3-5070-e878-51d3-59f9772f756b@gmail.com>
 <53ee2d0b-1867-5cad-667c-7f70085c645d@web.de>
 <e2eb2c23-d580-8c46-5bdb-a142b3791301@gmail.com>
 <c79a60b8-60a3-dd6e-76c3-d1fdfa003e49@gmail.com>
 <3050f0c1-549e-d4b9-50b5-468c11effea9@web.de>
 <CAMuHMdUNDcvKzOJ3JtWBQRVDF9d63K9Lot0-fKQcsaWTsadDvQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <jailhouse-dev+bncBDDNLV6S7AOBBCGBQPLQKGQEG2WNHIY@googlegroups.com>
Sender: jailhouse-dev@googlegroups.com
In-Reply-To: <CAMuHMdUNDcvKzOJ3JtWBQRVDF9d63K9Lot0-fKQcsaWTsadDvQ@mail.gmail.com>
Content-Language: en-US
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>, Alan Tull <atull@kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Jailhouse <jailhouse-dev@googlegroups.com>
List-Id: devicetree@vger.kernel.org

On 2018-04-25 21:53, Geert Uytterhoeven wrote:
> Hi Jan,
> 
> On Wed, Apr 25, 2018 at 9:40 PM, Jan Kiszka <jan.kiszka@web.de> wrote:
>> What other pointers are we talking about?
> 
> There's also the issue that some data has been allocated using kmalloc(),
> while others hasn't. The "other" pointers point to e.g. early bootmem or
> memblock.

Should not be an issue for overlays or of_changesets, should it?

Yes, I've learned the hard way that it is a very bad idea to build
changesets with properties that were not dynamically allocated. Maybe
that is documented somewhere, how the ownership of those objects change
after apply and how they may get handled later on. But now as I know,
it's kind of consistent and rather easy to account for.

Jan
