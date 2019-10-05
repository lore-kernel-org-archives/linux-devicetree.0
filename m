From: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH] of: unittest: fix memory leak in unittest_data_add
Date: Sat, 5 Oct 2019 16:34:09 +0200
Message-ID: <50421413-f535-a608-fa7d-1b337eeb95e5@web.de>
References: <20191004185847.14074-1-navid.emamdoost@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191004185847.14074-1-navid.emamdoost@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Navid Emamdoost <navid.emamdoost@gmail.com>, devicetree@vger.kernel.org
Cc: Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: devicetree@vger.kernel.org

> In unittest_data_add, a copy buffer is created via kmemdup. This buffer
> is leaked if of_fdt_unflatten_tree fails. The release for the
> unittest_data buffer is added.

Can a wording like the following be nicer for the change description?

  The buffer =E2=80=9C__dtb_testcases_begin=E2=80=9D will be duplicated to=
 the local
  variable =E2=80=9Cunittest_data=E2=80=9D. Release the corresponding memo=
ry
  after a call of the function =E2=80=9Cof_fdt_unflatten_tree=E2=80=9D fai=
led
  in the implementation of the function =E2=80=9Cunittest_data_add=E2=80=
=9D.


Regards,
Markus
