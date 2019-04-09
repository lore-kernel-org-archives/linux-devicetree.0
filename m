From: pierre kuo <vichy.kuo@gmail.com>
Subject: Re: [PATCH 1/1] of: reserved_mem: fix reserve memory leak
Date: Tue, 9 Apr 2019 10:13:00 +0800
Message-ID: <CAOVJa8F2eXE4yjj3OM0J3nd4GnW6brXuNLvF7h5Sdr1YSpQWAA@mail.gmail.com>
References: <20190219074500.16454-1-vichy.kuo@gmail.com> <CAL_Jsq+wUGxeQUMJd0eu52QadvLvkkT=36q9e1Qbru2gEsUGCw@mail.gmail.com>
 <CAOVJa8HUx-8Ok8yMm91UmXpo39KAipt6C1BsfOL1c0Q_kqs1Vg@mail.gmail.com> <CAOVJa8FROiP7e=p_4Bs=QxiwcdqD5ydrrO=6G2GX2TJkQh9U8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOVJa8FROiP7e=p_4Bs=QxiwcdqD5ydrrO=6G2GX2TJkQh9U8A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

hi Rob, Marek and Frank:

> >
> > In this patch, we un-reserving memory ONLY if explicit compatible matching fail.
> > That mean driver found something wrong while matching and let OS know.
> > (But reserved-memory without compatible property will not be affected.)
> >
> > So per ur explaination, there would be cases that driver reported
> > matching memory fail,
> > but the memory is still needed by another processor?
>

Would you mind to give some comment and suggestion for this patch?

Sincerely appreciate ur kind help.
