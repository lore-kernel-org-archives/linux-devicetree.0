From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH] kbuild: Handle builtin dtb files containing hyphens
Date: Wed, 7 Mar 2018 22:56:25 -0800
Message-ID: <2bb96235-6b1f-07bb-3dfe-d5dbb8eddb7f@gmail.com>
References: <20180307140633.26182-1-jhogan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180307140633.26182-1-jhogan@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: James Hogan <jhogan@kernel.org>, linux-kbuild@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Ralf Baechle <ralf@linux-mips.org>, Florian Fainelli <f.fainelli@gmail.com>, Kevin Cernekee <cernekee@gmail.com>, linux-mips@linux-mips.org, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 03/07/18 06:06, James Hogan wrote:
> On dtb files which contain hyphens, the dt_S_dtb command to build the
> dtb.S files (which allow DTB files to be built into the kernel) results
> in errors like the following:

< snip >

Hi James,

Sorry for dribbling my comments out in so many emails.  :-)

Please change the subject line to say "dtb filenames" instead
of "dtb files".

Thanks,

Frank
