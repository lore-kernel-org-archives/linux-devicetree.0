Return-Path: <SRS0=zVb5=JP=gmail.com=mr.ray.clinton@kernel.org>
MIME-Version: 1.0
From: Ray Clinton <mr.ray.clinton@gmail.com>
Date: Fri, 29 Jun 2018 09:45:28 -0400
Message-ID: <CAPMnawsaPg-KogsyfeMEdr7ykyux9HDBy8s7jfn1KOZAdeVnCA@mail.gmail.com>
Subject: of_n_{addr,size}_cells(struct device_node *np) - Allow for returning
 value of node passed in
Content-Type: text/plain; charset="UTF-8"
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

(I accidentally sent this originally with HTML formatting, sorry if
you are getting this twice.)

Hi,

I only just started doing anything with kernel development, this is my
first email on this list, so I'm sorry if I ask a dumb question or
mess up on any rules of etiquette, I'm trying to follow them.

I'm sure there is a reason for this, but of_n_{addr,size}_cells() will
only return a parent's #address-cells or #size-cells values. I realize
of_property_read_u32(np, "#address-cells", &cells), for example, could
be called on the current node to get that value, but is seems to be
that of_n_{addr,size}_cells() is a little bit of a misleading name; I
expected it to return the above mentioned values of the node passed
in, and if that was not explicitly defined it would look to the
parents. I ask because I ran into a problem when working on a driver
and trying to include an .dtsi that contained a node with different
values for #address-cells and #size-cells; I could never get the
correct values returned, I only got the parents'. So my questions are

1) If the methods are not meant to return the values for
#address-cells and #size-cells should it be named something like
of_n_parent_{addr,size}_cells?
2) If they are meant to return the values for the current node could
there be a check that looks something like this?:

int of_n_addr_cells(struct device_node *np)
{
       u32 cells;

       if (!of_property_read_u32(np, "#address-cells", &cells))
               return cells;

       do {
              if (np->parent)
              np = np->parent;
              if (!of_property_read_u32(np, "#address-cells", &cells))
                     return cells;
       } while (np->parent);
       /* No #address-cells property for the root node */
       return OF_ROOT_NODE_ADDR_CELLS_DEFAULT;
}

I realize I could be missing something and that this isn't an
important change, but I just thought I'd ask. Thanks so much!

Ray
