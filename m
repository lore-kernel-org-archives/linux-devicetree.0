From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] of/unittest: Missing unlocks on error
Date: Thu, 4 May 2017 11:09:00 -0500
Message-ID: <CAL_JsqKfXL6A=QbCrF=6tyn6HwZa5MafNvZtS-HbBBxkBqO7bw@mail.gmail.com>
References: <20170503194950.4xbdbwybvx6dkadx@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <20170503194950.4xbdbwybvx6dkadx@mwanda>
Sender: kernel-janitors-owner@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Frank Rowand <frank.rowand@sony.com>, Frank Rowand <frowand.list@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, May 3, 2017 at 2:49 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> Static checkers complain that we should unlock before returning.  Which
> is true.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.

Rob
