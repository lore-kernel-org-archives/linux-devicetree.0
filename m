From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] of: fdt: mark unflattened tree as detached
Date: Fri, 22 Jul 2016 14:55:48 -0500
Message-ID: <CAL_JsqJKL_E4aS6fWAmPLRWork=y1zUw58hdtz0pShB2zG_qzg@mail.gmail.com>
References: <cover.1466971467.git.hramrach@gmail.com> <01da4c372750e6618638a0320e7ea2f656da3ae5.1466971467.git.hramrach@gmail.com>
 <CAL_JsqLiFYbcqj__B+WB7Q4=MCsr0NOwg4BpRqg1GH+=gadsVg@mail.gmail.com> <12088f6fd9a39fc28f6756ec4c1ba034b9a37f0b.1468879073.git.hramrach@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <12088f6fd9a39fc28f6756ec4c1ba034b9a37f0b.1468879073.git.hramrach@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Suchanek <hramrach@gmail.com>
Cc: Frank Rowand <frowand.list@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 18, 2016 at 5:01 PM, Michal Suchanek <hramrach@gmail.com> wrote:
> The tree returned from of_fdt_unflatten_tree cannot be attached to the
> live tree because it is not marked as detached so mark it as such. The
> dt resolver checks the flag and refuses to process the tree otherwise.
>
> Signed-off-by: Michal Suchanek <hramrach@gmail.com>
> ---
>  - rebase on top of 4.7rc

Applied, thanks.

Rob
