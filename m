From: Philippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org>
Subject: Re: [PATCH v4 00/12] [dt-bindings] [media] Add document file and
 driver for Sony CXD2880 DVB-T2/T tuner + demodulator
Date: Thu, 14 Dec 2017 15:25:13 +0100
Message-ID: <CAOFm3uEYfMH8Zj8uEx-D9yYrTyDMTG_j02619esHu-j0brQKaA@mail.gmail.com>
References: <20171013054635.20946-1-Yasunari.Takiguchi@sony.com>
 <20171213173633.57edca85@vento.lan> <02699364973B424C83A42A84B04FDA85431742@JPYOKXMS113.jp.sony.com>
 <20171214085503.289f06f8@vento.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171214085503.289f06f8-ch4gOOMV7nf/PtFMR13I2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mauro Carvalho Chehab <mchehab-JsYNTwtnfakRB7SZvlqPiA@public.gmane.org>
Cc: "Takiguchi, Yasunari" <Yasunari.Takiguchi-7U/KSKJipcs@public.gmane.org>, "akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org" <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "tbird20d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <tbird20d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Yamamoto, Masayuki" <Masayuki.Yamamoto-7U/KSKJipcs@public.gmane.org>, "Nozawa, Hideki (STWN)" <Hideki.Nozawa-7U/KSKJipcs@public.gmane.org>, "Yonezawa, Kota" <Kota.Yonezawa-7U/KSKJipcs@public.gmane.org>, "Matsumoto, Toshihiko" <Toshihiko.Matsumoto-7U/KSKJipcs@public.gmane.org>, "Watanabe, Satoshi (SSS)" <Satoshi.C.Watanabe-7U/KSKJipcs@public.gmane.org>, "Bird, Timothy" <Tim.Bird-7U/KSKJipcs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dear Mauro,

On Thu, Dec 14, 2017 at 11:55 AM, Mauro Carvalho Chehab
<mchehab-JsYNTwtnfakRB7SZvlqPiA@public.gmane.org> wrote:

> SPDX is a new requirement that started late on Kernel 4.14 development
> cycle (and whose initial changes were merged directly at Linus tree).
> Not all existing files have it yet, as identifying the right license
> on existing files is a complex task, but if you do a:
>
>         $ git grep SPDX $(find . -name Makefile) $(find . -name Kconfig)
>
> You'll see that lot of such files have it already.

FWIW, short of having SPDX tags, identifying the right license on
existing files is not a super complex task: if boils down to running
many diffs.

Take the ~60K files in kernel, and about 6K license and notices
reference texts. Then compute a pairwise diff of each of the 60K file
against the 6K reference texts. Repeat the pairwise diff a few more
times, say 10 times, as multiple licenses may appear in any given
kernel file. And keep the diffs that have the fewest
difference/highest similarity with the reference texts as the detected
license. Done!

The only complex thing is that if you have a fast diff that runs at
0.1 millisec end-to-end per diff, you still have 3.6B diffs to do and
this would take about 250 days on one thread. Even with a beefy 250
core CPU, that would still be a day (and quite few kilo watts) . So
the whole trick is to avoid doing a diffs if not really needed. This
is what I do in my scancode-toolkit (that I used/use to help Greg and
Thomas with kernel license scans). Net effect is that on a laptop on 8
threads it takes ~20 minutes to scan a whole kernel using this
diff-based approach and obtain a fairly accurate license detection.
-- 
Cordially
Philippe Ombredanne
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
